class HomeController < ApplicationController
  def index
  		if amitian_signed_in?
  			redirect_to confessions_path
  	  end
  	 end
end
