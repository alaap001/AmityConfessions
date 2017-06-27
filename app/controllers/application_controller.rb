class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # global variables 
TOP_STORY = Confession.order('cached_votes_up DESC').first
 before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:fullname,:nickname,:gender,:email,:campus,:institute,:alumni,:password,:password_confirmation,:profilepic,:search,:last_sign_out_at)
    end

	 devise_parameter_sanitizer.permit(:account_update) do |user_params|
 	user_params.permit(:fullname,:nickname,:email,:gender,:password,:campus,:alumni,:institute,:password_confirmation,:current_password,:profilepic,:cover,:remove_profilepic ,:last_sign_out_at, :remove_cover)
 end	

end
end
