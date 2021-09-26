Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :fosters
  devise_for :fosters, only: :sessions, module: :admin
  passwordless_for :fosters, at: '/', as: :auth

  post 'signup', to: 'signups#create', as: :signup
  get 'signup', to: 'signups#new', as: :new_signup

  get '/status', to: 'status#show', as: :foster_root

  authenticated :admin do
    resources :fosters
    root "fosters#index", as: :admin_root
  end

  root to: 'signups#new'
end
