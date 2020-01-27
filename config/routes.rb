Rails.application.routes.draw do
  devise_for :users
  get '/search', to: 'search#index'
  post '/search', to: 'search#show'
  root 'search#index'
end