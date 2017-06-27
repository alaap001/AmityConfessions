class FeelingController < ApplicationController

before_action :authenticate_amitian!

	def index

if current_amitian.about_amitian == nil
		redirect_to new_about_amitian_url
	else
		if amitian_signed_in? 
			male = Amitian.where.not(id: current_amitian.id)
			@male = male.where('gender = "Male"').paginate(page: params[:page], per_page: 12).order('last_sign_in_at DESC')
			female = Amitian.where.not(id: current_amitian.id)
			@female = female.where('gender = "Female"').paginate(page: params[:page], per_page: 12).order('last_sign_in_at DESC')
			@interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?
		end
	end
	respond_to do |format|
  format.html
  format.js
end
end		

end