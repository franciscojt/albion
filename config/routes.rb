Rails.application.routes.draw do


# DISPLAY ROUTES
root 'displays#index'
get '/projects' => 'displays#project'
get '/about' => 'displays#about'

resources :sessions, only: [:create, :destroy, :new]
resources :quotes, only: [:new,:create]
resources :users, :results
post '/results/find'=> 'results#show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
