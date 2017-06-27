class EventpostsController < ApplicationController
	def create
		@confession = current_amitian.eventposts.build(event_post_params)
		@confession.event_id = params[:event_id]
		if @confession.save
			redirect_to :back
		end
	end

	def edit
		@eventpost = Eventpost.find(params[:id])
	end

	def update
		@eventpost = Eventpost.find(params[:id])
  	if @eventpost.update(event_post_params)
  		redirect_to :back
  		else
  			render 'edit'
  		end
	end

def upvote
  @posts = Eventpost.find(params[:id])
  @posts.upvote_by current_amitian
  #create_notification_like @posts
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

def downvote
  @posts = Eventpost.find(params[:id])
  @posts.downvote_by current_amitian
  #create_notification_dislike @posts
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

	def destroy
		@eventpost = Eventpost.find(params[:id])
    @eventpost.destroy
    respond_to do |format|
      format.html
      format.js
    end
	end
	private
		def event_post_params
			params.require(:eventpost).permit(:content,:amitian_id,:event_id,:event_post_image);
		end
end
