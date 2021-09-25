Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :fosters
  devise_for :fosters
  passwordless_for :fosters, at: '/', as: :auth

  post 'signups', to: 'signups#create', as: :signup
  get 'signups', to: 'signups#new', as: :new_signup
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  root "fosters#index" # CHANGE THIS
end
