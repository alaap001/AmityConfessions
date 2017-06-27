class Amitians::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
     super
   end

  # POST /resource/sign_in
   def create
      current_amitian.update_attribute(:current_sign_in_at, Time.now+19800)
     super
   end

  # DELETE /resource/sign_out
   def destroy
    current_amitian.update_attribute(:last_sign_out_at, Time.now+19800)
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
