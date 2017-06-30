class ConfessionsController < ApplicationController
before_action :authenticate_amitian!, except: [:show]

def index 
 # @sign in .. show forst sign in div

if current_amitian.about_amitian == nil
  redirect_to new_about_amitian_url
else
  if amitian_signed_in?
    @club = Club.new

    @event = Event.new

    owner = current_amitian.clubs

    member = current_amitian.clubmembers

    @myclubs = owner + member

    newclubs = Club.where.not(amitian_id: current_amitian).limit(5).order('RAND()')
    
    @newclubs = newclubs.where(created_at: Time.now-15.days .. Time.now).limit(4)
    
    @newevents = Event.where(start: Time.now .. Time.now+ 7.days).limit(4).order('start ASC')
    
    @amitian = Amitian.where(institute: current_amitian.institute) 
    
    @confession = current_amitian.confessions.build 
    
    @feed = current_amitian.feedbacks.build   
    
    @suggetions2 = Amitian.where.not(id: current_amitian.id).limit(35).order('RAND()')
    
    @anonymous = Amitian.where(email: 'anonymous@anonymous.com')
    
    @following = current_amitian.following
    
    ids = @anonymous.ids
    
    ids.concat(@amitian.ids).concat(@following.ids) 
    
    nonanony = (@amitian.ids).concat(@following.ids)
    
    @confessions= Confession.where(amitian_id: ids).paginate(page: params[:page], per_page: 15).order('created_at DESC')
    
    newcommers = Amitian.where(created_at: Time.now-15.days .. Time.now).limit(10).order('RAND()')
    
    newcommersid = current_amitian.following.ids + Array.[](current_amitian.id)
    
    @newcommers = newcommers.where.not(id: newcommersid).limit(4).order('RAND()')
    
    @tconfessions=Confession.where(amitian_id: nonanony).size
    
    @topstory = TOP_STORY
    
    @interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?
    
    male = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
    
    @male = male.where('gender = "Male"')
    
    female = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
    
    @female = female.where('gender = "Female"')
    
     @friends = current_amitian.active_friends + current_amitian.received_friends
    
    respond_to do |format|
      format.html
      format.js
   end
else
  redirect_to root_path
end
end
end

def explore
if current_amitian.about_amitian == nil
  redirect_to new_about_amitian_url
else
mainevent = Event.where(start: Time.now-1.days .. Time.now+1.days)

mainevent = Event.find_by_sql(" SELECT events.*, COUNT(events.id) AS total_followers
  FROM events
  INNER JOIN follows ON events.id = follows.id
  GROUP BY follows.id
  ORDER BY total_followers DESC;")
# important point is that i have to sort this out based o max no of followers
@mainevent = mainevent.first
moreevent = mainevent - Array.[](@mainevent)
@moreevent = moreevent.take(4)
@upcommingevent = Event.where(start: Time.now-1.days .. Time.now+8.days).where.not(id: @mainevent.id)
.order('start ASC').limit(10)

mainclub = Club.find_by_sql("SELECT c.*, COUNT(cm.id) AS total
FROM clubs c INNER JOIN
     clubmembers cm
     ON c.id = cm.club_id
GROUP BY c.id
ORDER BY total ASC;")

@mainclub = mainclub.first
moreclub = mainclub - Array.[](@mainclub)
@moreclub = moreclub.take(4)
@sugclub = Club.all.order('created_at DESC')

@anonymous = Amitian.find_by(email: 'anonymous@anonymous.com')
@topconfessions = Confession.where.not(amitian_id: @anonymous.id).order('cached_votes_up DESC').limit(8)
@hatedconfessions = Confession.where.not(amitian_id: @anonymous.id).order('cached_votes_down DESC').limit(8)
@topanonyconfession = Confession.where(amitian: @anonymous.id).order('cached_votes_up DESC')
@friendships = Friendship.where(accepted: '1').order('updated_at DESC')
@interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?

@male = Amitian.where.not(id: current_amitian.id).where('gender = "Male"').order('RAND()').limit(20)    
@female = Amitian.where.not(id: current_amitian.id).where('gender = "Female"').order('RAND()').limit(20)
# only show images... don't create a div with name or follow form.. 
# just images straint in a div.. col-sm-1 12 n a linie
newcommers = Amitian.where(created_at: Time.now-15.days .. Time.now).limit(10).order('RAND()')

newcommersid = current_amitian.following.ids + Array.[](current_amitian.id)

@newcommers = newcommers.where.not(id: newcommersid).limit(4).order('RAND()')


end
end

def show 
  @confessions = Confession.find(params[:id])
  @comment = Confessioncomment.where(confession_id: @confessions).paginate(page: params[:page], per_page: 5).order('created_at ASC')
  
end

def upvote
  @confessions = Confession.find(params[:id])
  @confessions.upvote_by current_amitian
  create_notification_like @confessions
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

def downvote
  @confessions = Confession.find(params[:id])
  @confessions.downvote_by current_amitian
  create_notification_dislike @confessions
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

def create
	@anonymous = Amitian.where(email: 'anonymous@anonymous.com')
  @anonymous.each do |a|
if params[:confession][:postid] == 'Anonymous'
  @confession = a.confessions.build(confession_params)
else
  @confession = current_amitian.confessions.build(confession_params)
 end
end
if @confession.save
  	redirect_to :back
  else
  	redirect_to :back
  end
end
	
  def edit
@confession = Confession.find(params[:id])
 if !current_amitian.confessions.ids.include? @confession.id
    redirect_to root_path
  end
  end

  def update
@confession = Confession.find(params[:id])
if @confession.update(confession_params)
  flash[:notice] = 'Successfully Edited'
  redirect_to :back
else
  render 'edit'
  end
end

def destroy
@confessions = Confession.find(params[:id])
@confessions.destroy
respond_to do |format|
  format.js
end
end

private
def confession_params
	params.require(:confession).permit(:confession,:confessionimage,:remove_confessionimage,:postid)
	end
end

def create_notification_like(confessions)
return if confessions.amitian.id == current_amitian.id
Notification.create(amitian_id: confessions.amitian.id , notice_type: 'like', confession_id: confessions.id , notified_by_id: current_amitian.id)
end

def create_notification_dislike(confessions)
return if confessions.amitian.id == current_amitian.id
Notification.create(amitian_id: confessions.amitian.id , notice_type: 'dislike', confession_id: confessions.id , notified_by_id: current_amitian.id)
end