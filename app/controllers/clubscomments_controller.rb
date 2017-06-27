class ClubscommentsController < ApplicationController
	before_action :authenticate_amitian!

	def create
		@post = Clubpost.find(params[:clubpost_id])
		@comment = @post.clubscomments.build(club_comment_params)
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
		@clubpost = Clubpost.find(params[:clubpost_id])
			@comment = Clubcomment.find(params[:id])
	end



	def update
		@clubpost = Clubpost.find(params[:clubpost_id])
		@comment = Clubcomment.find(params[:id])
  	if @clubpost.clubscomments.update(club_comment_params)
  		redirect_to :back
  		else
  			render 'edit'
  		end
	end

	def destroy
		@clubpost = Clubpost.find(params[:clubpost_id])
		@comment = Clubscomment.find(params[:id])
    if @comment.amitian_id == current_amitian.id || current_amitian == @clubpost.amitian
 @comment.destroy
 respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
     end

	end


	private
		def club_comment_params
			params.require(:clubscomment).permit(:content,:amitian_id,:clubpost_id);
		end
end
