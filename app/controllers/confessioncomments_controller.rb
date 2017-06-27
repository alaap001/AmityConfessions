class ConfessioncommentsController < ApplicationController
before_action :authenticate_amitian!

def create
@confessions = Confession.find(params[:confession_id])
@comment = @confessions.confessioncomments.build(comment_params)
@comment.amitian_id = current_amitian.try(:id)

if(@comment.save)
	respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
      create_notification @confessions
else
	render 'new'

end
end

def destroy
	@confessions = Confession.find(params[:confession_id])
	@comment = Confessioncomment.find(params[:id])
	if @comment.amitian_id == current_amitian.id || current_amitian == @confessions.amitian
 @comment.destroy
 respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
     end
end

def new
end

def update
			@confessions = Confession.find(params[:confession_id])
	
if @confessions.confessioncomments.update(comment_params)
	redirect_to @confessions
else
	render 'edit'
end
end

def edit
		@confessions = Confession.find(params[:confession_id])
	@comment = Confessioncomment.find(params[:id])
end

private

def comment_params
params.require(:confessioncomment).permit(:content)
	end

def create_notification(confessions)
return if confessions.amitian.id == current_amitian.id
Notification.create(amitian_id: confessions.amitian.id , notice_type: 'comment', confession_id: confessions.id , notified_by_id: current_amitian.id)
end

end

