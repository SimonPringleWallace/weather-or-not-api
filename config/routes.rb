# frozen_string_literal: true

Rails.application.routes.draw do
  get 'forecast/index'
  resources :locations, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  # Dark Sky Route
  get '/forecast' => 'forecast#index'
end
