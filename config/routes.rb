Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :fosters
  devise_for :fosters, only: [:sessions]
  passwordless_for :fosters, at: '/', as: :auth

  unauthenticated do
    post 'signup', to: 'signups#create', as: :signup
    get 'signup', to: 'signups#new', as: :new_signup
  end

  authenticated :admin do
    resources :fosters
    root "fosters#index", as: :admin_root
  end

  root to: 'signups#new'
end
