class HotlistsController < ApplicationController

def index
	@hotlists = current_amitian.hotlisting
end

def create 

@amitian = Amitian.find(params[:hotlisted_id])
	current_amitian.hotlistamitian(@amitian)
 render nothing: true
end

def destroy
 @amitian = Hotlist.find(params[:id]).hotlisted
    current_amitian.removehotlist(@amitian)
   respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
end
end