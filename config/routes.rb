Rails.application.routes.draw do

  get 'chatarea/index'

  get 'chatrooms/index'

devise_for :amitians, controllers: { sessions: 'amitians/sessions' }, path: '',path_names: { sign_in: 'login', sign_out: 'logout'}

root 'home#index'
  resources :amitians  do
    member do
   get :following, :followers
   get :hotlisting
    end
end

resources :clubs
resources :clubposts do
 resources :clubscomments
    member do
      get 'like' , to: 'clubposts#upvote'
      get 'dislike' , to: 'clubposts#downvote'
    end
end
resources :clubmembers, only: [:create, :update, :destroy]
resources :events
resources :eventposts do 
  resources :eventcomments
  member do
      get 'like' , to: 'eventposts#upvote'
      get 'dislike' , to: 'eventposts#downvote'
  end
  end
resources :about_amitians, only: [:show,:new,:create,:update,:edit]
resources :friendships, only: [:create, :update, :destroy]
resources :galleries 
resources :chatrooms do
    resources :messages
  end
  resources :confessions do
     resources :confessioncomments   
  	member do
  		get 'like' , to: 'confessions#upvote'
  		get 'dislike' , to: 'confessions#downvote'
  	end
  end

  resources :hotlists

resources :conversations , only: [:create ]  do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

resources :feeling , only: [:index]
resources :relationships, only: [:create, :destroy]
resources :feedbacks
get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through
get 'notifications', to: 'notifications#index' 
post 'notifications' , to: 'notifications#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
