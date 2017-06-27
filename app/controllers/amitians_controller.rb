class AmitiansController < ApplicationController

before_action :authenticate_amitian!, except: [:show]

def index
@amit = Amitian.amitian_search(params[:amitian_search])
@topstory = TOP_STORY
     @interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?
      male = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
      @male = male.where('gender = "Male"')
      female = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
      @female = female.where('gender = "Female"')
     @friends = current_amitian.active_friends + current_amitian.received_friends
     owner = current_amitian.clubs
    member = current_amitian.clubmembers
    @myclubs = owner + member

end

def show
@amitian = Amitian.find(params[:id])

@gallery = Gallery.new
if @amitian.about_amitian != nil
  if current_amitian.about_amitian !=nil
@gender = @amitian.gender
@interest = current_amitian.about_amitian.interest
end
end
@total = (@amitian.active_friends.count + @amitian.received_friends.count).to_i
@confessions = Confession.where(amitian_id: @amitian).paginate(page: params[:page], per_page: 10).order('created_at DESC').all
respond_to do |format|
  format.html
  format.js
 end
end

def following
    @title = "Following"
    @amitian  = Amitian.find(params[:id])
    @amitians = @amitian.following
    render 'show_follow'
end

def followers
  @title = "Followers"
  @amitian  = Amitian.find(params[:id])
  @amitians = @amitian.followers
  render 'show_follow'
end

def hotlisting   
    @amitians = current_amitian.hotlisting
    render 'show_hotlist'
end


def destroy
@amitian = Amitian.find(params[:id])
@confessions = Confession.where(amitian_id: @amitian)
@confessions.destroy
redirect_to :back
end

end
