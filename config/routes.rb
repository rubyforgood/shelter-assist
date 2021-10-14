Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :animals
  devise_scope :person do
    resources :people
  end

  # admin
  devise_for :people, only: [:sessions, :passwords], module: :admin, path_prefix: :admin
  # non-admin people
  passwordless_for :people, at: '/', as: :auth

  post 'signup', to: 'signups#create', as: :signup
  get 'signup', to: 'signups#new', as: :new_signup

  get '/status', to: 'status#show', as: :person_root

  authenticated :admin do
    root "people#index", as: :admin_root
  end

  root to: "home_page#index"
end
