class EventcommentsController < ApplicationController
	before_action :authenticate_amitian!

	def create
		@post = Eventpost.find(params[:eventpost_id])
		@comment = @post.eventcomments.build(event_comment_params)
		@comment.amitian_id = current_amitian.id
		if @comment.save
			respond_to do |format|
	        format.html { redirect_to :back }
	        format.js
	      end
      #create_notification @confessions
  else
  	render 'new'
		end
	end

	def new
	end

	def edit
		@eventpost = Eventpost.find(params[:eventpost_id])
			@comment = Eventcomment.find(params[:id])
	end



	def update
		@eventpost = Eventpost.find(params[:eventpost_id])
		@comment = Eventcomment.find(params[:id])
  	if @eventpost.eventscomments.update(event_comment_params)
  		redirect_to :back
  		else
  			render 'edit'
  		end
	end

	def destroy
		@eventpost = eventpost.find(params[:eventpost_id])
		@comment = Eventcomment.find(params[:id])
    if @comment.amitian_id == current_amitian.id || current_amitian == @eventpost.amitian
 @comment.destroy
 respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
     end

	end


	private
		def event_comment_params
			params.require(:eventcomment).permit(:content,:amitian_id,:eventpost_id);
		end
end
