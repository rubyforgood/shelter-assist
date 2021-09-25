Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :fosters
  devise_for :fosters, only: [:sessions, :registrations]
  passwordless_for :fosters, at: '/', as: :auth

  unauthenticated :foster do
    post 'signup', to: 'signups#create', as: :signup
    get 'signup', to: 'signups#new', as: :new_signup
    root to: 'signups#new', as: :unauthenticated_root
  end

  authenticated :foster do
    get '/', to: 'status#show', as: :foster_root
  end

  authenticated :admin do
    resources :fosters
    root "fosters#index", as: :admin_root
  end

  root to: 'signups#new'
end
