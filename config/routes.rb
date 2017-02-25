Rails.application.routes.draw do
  root 'home#index'

  #### User Resources ####
  get '/signup',                          to: 'users#new', as: 'new_user'
  get '/profile',                         to: 'users#show'
  resources :users,                       only: [:index, :create]


  #### Session Resources ####
  get '/login',                           to: 'sessions#new', as: :new_session
  resources :sessions,                    only: [:create, :destroy]


  #### Oauth Singn up routes ####
  get '/auth/facebook',                   as: :facebook_login
  get 'auth/facebook/callback',           to: 'sessions#create'


  #### Search Resources ####
  get "/search",                          to: 'search#index', as: 'search'
end
