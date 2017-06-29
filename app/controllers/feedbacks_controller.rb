class FeedbacksController < ApplicationController

before_action :authenticate_amitian!
def create 
@feedback = current_amitian.feedbacks.build(feedback_params)
if @feedback.save
redirect_to :back
else
      flash[:notice] = "Error in form"
	redirect_to :back

end
end
private
	def feedback_params
params.require(:feedback).permit(:name,:title,:content)
	end
end
