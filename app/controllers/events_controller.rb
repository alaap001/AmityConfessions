class EventsController < ApplicationController
before_action :authenticate_amitian!

 def index

  end

  def show
    @event = Event.find(params[:id])

    @posts = Eventpost.where(event_id: @event.id).order('created_at DESC')
    @eventsug = Event.where(niche: @event.niche)
    @eventupcomming = Event.where(start: Time.now .. Time.now+ 3.days)
    clubowner = current_amitian.clubs
    clubmember = current_amitian.clubmembers
    @myclubs = clubowner + clubmember
    @topstory = TOP_STORY
    @interest = current_amitian.about_amitian.interest if current_amitian.about_amitian.interest?
     male = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
      @male = male.where('gender = "Male"')
      female = Amitian.where.not(id: current_amitian.id).order('RAND()').limit(5)
      @female = female.where('gender = "Female"')
      
     @friends = current_amitian.active_friends + current_amitian.received_friends
  
  @confession = current_amitian.eventposts.build
  end

  def create
  	@event = current_amitian.events.build(event_params)
  	@event.club_id = params[:club_id]
  	if @event.save
  		redirect_to @event
  	end
  end

  def edit
  end

  def update
  end

  def detroy
    
  end

private
def event_params
params.require(:event).permit(:eventtheme,:location,:start,:endtime,:description,:tags,:event_themepic,:department,:niche,:club_id)
	end

end
