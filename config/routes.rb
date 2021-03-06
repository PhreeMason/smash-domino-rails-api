Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
    	resources :users, only: [:create]
      post '/auth', to: 'auth#login'
      post 'auth/refresh', to: 'auth#refresh'
      post 'chatrooms/direct_message', to: 'chatrooms#direct_message'
      patch 'users', to: 'users#update'
      get 'users/:username', to: 'users#show'
      resources :chatrooms do
        resource :chatroom_users, only: [:create, :destroy]
        resources :messages, only: [:create]
      end
    end
  end 

  mount ActionCable.server => '/cable'

 

end
