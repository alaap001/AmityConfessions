class AboutAmitiansController < ApplicationController
  
  before_action :authenticate_amitian!

def show
@amitian = Amitian.find(params[:id])
active_friends = @amitian.active_friends
passive = @amitian.received_friends
@friends = active_friends + passive
@confessions = @amitian.confessions.order('cached_votes_up DESC').limit(3)
if current_amitian.about_amitian == nil && @amitian == current_amitian
	redirect_to new_about_amitian_url
elsif current_amitian.about_amitian == nil && @amitian != current_amitian
end

@clubs = Club.where(amitian_id: @amitian)
end

  def new
  	if current_amitian.about_amitian == nil
  @about_amitian = AboutAmitian.new
 else
 	redirect_to root_url

end
  end

  def create
  	@about_amitian = current_amitian.create_about_amitian(about_amitian_params)
  	if @about_amitian.save
  			redirect_to :back
  			flash[:notice] = 'Abouts are Saved'
  		else
  			render root_url
  		end
  end

def update
  @about_amitian = AboutAmitian.find(params[:id])
  if @about_amitian.update(about_amitian_params)
    redirect_to @about_amitian.amitian
  else
    render 'edit'
  end
end

def edit
  @amitian = Amitian.find(params[:id])
if @amitian != current_amitian
  redirect_to root_url
else
@about_amitian = @amitian.about_amitian
end
end
private

	def about_amitian_params
	params.require(:about_amitian).permit(:dob,:interest,:bio,:catch_phrase,:course,:graduation_year,:memories,:relationship_status)
	end

end

