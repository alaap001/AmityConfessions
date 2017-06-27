class ClubpostsController < ApplicationController
	before_action :authenticate_amitian!

	def create
		@confession = current_amitian.clubposts.build(club_post_params)
		@confession.club_id = params[:club_id]
		if @confession.save
			redirect_to :back
		end
	end

	def edit
		@clubpost = Clubpost.find(params[:id])
	end

	def update
		@clubpost = Clubpost.find(params[:id])
  	if @clubpost.update(club_post_params)
  		redirect_to :back
  		else
  			render 'edit'
  		end
	end

def upvote
  @posts = Clubpost.find(params[:id])
  @posts.upvote_by current_amitian
  #create_notification_like @posts
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

def downvote
  @posts = Clubpost.find(params[:id])
  @posts.downvote_by current_amitian
  #create_notification_dislike @posts
  respond_to do |r|
    r.html{redirect_to :back}
    r.js
  end
end

	def destroy
		@clubpost = Clubpost.find(params[:id])
    @clubpost.destroy
    respond_to do |format|
      format.html
      format.js
    end
	end
	private
		def club_post_params
			params.require(:clubpost).permit(:content,:amitian_id,:club_id,:clubpost_image);
		end
end
