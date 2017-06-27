class FriendshipsController < ApplicationController
before_action :authenticate_amitian!

  def create
  @friendship = current_amitian.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
  end

  def update
  	 @friendship = Friendship.where(friend_id: current_amitian , amitian_id: params[:id])
    if @friendship.update(accepted: true)
    flash[:notice] = "Request Accepted"
    else
    flash[:notice] = "Request Declined"
    end
     redirect_to :back
  end

  def destroy   
    @friendship = Friendship.where(friend_id: current_amitian , amitian_id: params[:id])
    @friendship2 = Friendship.where(amitian_id: current_amitian , friend_id: params[:id])
    @friendship3 = Friendship.where(friend_id: current_amitian)
   
   if !@friendship.empty?
    Friendship.destroy(@friendship.ids.first)
    flash[:notice] = "Removed friendship."
    redirect_to :back
  elsif !@friendship2.empty?
    Friendship.destroy(@friendship2.ids.first)
    flash[:notice] = "Removed friendship."
    redirect_to :back
  elsif !@friendship3.empty?
    Friendship.destroy(@friendship3.ids.first)
    flash[:notice] = "Removed friendship."
    redirect_to :back
  else
    flash[:notice] = "Unable to Remove friendship"
    redirect_to :back
  end
  end

end
