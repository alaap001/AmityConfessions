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
    @clubnames =  current_amitian.clubs
    @amitian = Amitian.where(institute: current_amitian.institute) 
    @confession = current_amitian.confessions.build 
    @feed = current_amitian.feedbacks.build   
    @suggetions = Amitian.where.not(id: current_amitian.id).limit(5).order('RAND()')
    @suggetions2 = Amitian.where.not(id: current_amitian.id).limit(35).order('RAND()')
    @anonymous = Amitian.where(email: 'anonymous@anonymous.com')
    @following = current_amitian.following 
    ids = @anonymous.ids
    ids.concat(@amitian.ids).concat(@following.ids) 
    nonanony = (@amitian.ids).concat(@following.ids)
    @confessions= Confession.where(amitian_id: ids).paginate(page: params[:page], per_page: 15).order('created_at DESC')
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