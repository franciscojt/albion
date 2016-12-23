Rails.application.routes.draw do
resources :sessions, only: [:create, :destroy, :new]
resources :quotes, only: [:new,:create]
resources :users, :results
post '/results/find'=> 'results#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
