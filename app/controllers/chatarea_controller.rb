class ChatareaController < ApplicationController
before_action :authenticate_amitian!
  def index
  	session[:conversations] ||= []
  	@friends = current_amitian.active_friends + current_amitian.received_friends
  	@conversation = Conversation.includes(:recipient , :messages).find(session[:conversations])
  end	
end
