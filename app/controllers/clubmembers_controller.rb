class ClubmembersController < ApplicationController
before_action :authenticate_amitian!

  def create
  	@club = Club.find(params[:club_id])
  	@amitian = Amitian.find(params[:amitian_id])
      if params[:notif_id] != '0'
        @notification = Notification.find(params[:notif_id]) 
      else
        @notification = nil
      end
  @invitation = @club.clubmembers.build(amitian_id: params[:amitian_id])    
  if @invitation.save  
    Notification.destroy(@notification) if @notification != nil
  end   
      create_notification_invite @amitian,@club
      render nothing: true
  end

  def update
  	 @invitation = Clubmember.where(amitian_id: current_amitian , club_id: params[:id])
  	 @notification = Notification.find(params[:notif_id])
     Notification.destroy(@notification)
    if @invitation.update(accepted: true)
    flash[:notice] = "Invitation Accepted"
    else
    flash[:notice] = "Invitation Declined"
    end
     redirect_to :back
  end

  def destroy   
  	@notification = Notification.find(params[:notif_id])
  	@invitation = Clubmember.where(club_id: params[:id],amitian_id: current_amitian)
  	Notification.destroy(@notification)
  	if Clubmember.destroy(@invitation.ids.first)
  		redirect_to :back
  	end
  end
  

private

def create_notification_invite(amitian,club)

Notification.create(amitian_id: amitian.id , notice_type: 'invites', club_id: club.id)
end

end
