class NotificationsController < ApplicationController

before_action :authenticate_amitian!

def index
	@notifications = current_amitian.notifications.paginate(page: params[:page], per_page: 30).order('created_at DESC')
	 @amitian = Amitian.all
   
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

def create
Notification.create(notice_type: params[:notice_type], notified_by_id: params[:notified_by_id] , club_id: params[:club_id] , amitian_id: params[:amitian_id])
render nothing: true
end

def link_through  
  @notification = Notification.find(params[:id])
  @notification.update read: true
  if @notification.notice_type == 'follow' 
  		redirect_to @notification.notified_by
    elsif @notification.notice_type == 'ask_invite'
      redirect_to @notification.club 
	else
	  redirect_to confession_path @notification.confession
	end
end  

end
