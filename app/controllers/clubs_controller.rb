class ClubsController < ApplicationController
before_action :authenticate_amitian!

def index 

end

  def show
    @club = Club.find(params[:id])
    @event = Event.new
    search_results = Amitian.search(params[:search])
    
    clubowner = current_amitian.clubs
    
    clubmember = current_amitian.clubmembers
    
    @myclubs = clubowner + clubmember
    
    amitians = @club.pending_invitations
    
    amitians2 = @club.active_invitations
    
    ownerw = @club.amitian
    
    owner = Array.[](ownerw)
    
    @member = amitians2 + owner
    
    final = amitians+amitians2
    
    suggestions = Amitian.where(institute: current_amitian.institute)
    
    @suggestions = suggestions - amitians-@member
    
    @amitian = search_results - final - owner
    
     @topstory = TOP_STORY
    
     @interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?
    
      male = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
    

      @male = male.where('gender = "Male"')
    
      female = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
    
      @female = female.where('gender = "Female"')
    
     @friends = current_amitian.active_friends + current_amitian.received_friends
    
     clubposts = @club.clubposts
    
     @gallery = clubposts.where.not(clubpost_image: nil).order('RAND()').limit(6)
    
    @confession = current_amitian.clubposts.build 
    
    @posts = Clubpost.where(club_id: @club.id).order('created_at DESC')
  
  end

  def create
  	@club = current_amitian.clubs.build(club_params)
    if @club.save
        redirect_to @club
      else
      redirect_to :back
      flash[:notice] = "Error in form"
    end

  end

  def edit
  	@club = Club.find(params[:id])
  end

  def update
  	@club = Club.find(params[:id])
  	if @club.update(club_params)
  		redirect_to @club
  		else
  			render 'edit'
  		end
  end


  def destroy
    @club = Club.find(params[:id])
    if @club.destroy
      redirect_to root_path
    end
  end

private

def club_params
	params.require(:club).permit(:clubname,:club_theme,:description,:club_themepic,:club_cover,:niche,:amitian_id,:website)
end
end
