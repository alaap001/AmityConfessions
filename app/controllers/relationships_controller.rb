class RelationshipsController < ApplicationController

before_action :authenticate_amitian!

  def create
    @amitian = Amitian.find(params[:followed_id])
    
    current_amitian.follow(@amitian)
create_notification_follow @amitian
     respond_to do |format|
      format.html {render nothing: true }
      format.js
    end
  end

  def destroy
    @amitian = Relationship.find(params[:id]).followed
    current_amitian.unfollow(@amitian)
     respond_to do |format|
      format.html { redirect_to @amitian }
      format.js
    end
  end

  private
  def create_notification_follow(amitian)
  return if amitian.id == current_amitian.id
  Notification.create(amitian_id: amitian.id , notice_type: 'follow' , notified_by_id: current_amitian.id)
  end

end
