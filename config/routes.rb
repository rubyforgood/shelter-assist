Rails.application.routes.draw do
  resources :rescues
  resources :animal_applications
  resources :homes
  devise_scope :foster do
    resources :fosters
  end

  # admin
  devise_for :fosters, only: [:sessions, :passwords], module: :admin, path_prefix: :admin
  # non-admin fosters
  passwordless_for :fosters, at: '/', as: :auth

  post 'signup', to: 'signups#create', as: :signup
  get 'signup', to: 'signups#new', as: :new_signup

  get '/status', to: 'status#show', as: :foster_root

  authenticated :admin do
    root "fosters#index", as: :admin_root
  end

  root to: 'signups#new'
end
