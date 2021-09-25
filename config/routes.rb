Rails.application.routes.draw do
  resources :animal_applications
  resources :homes
  resources :fosters
  devise_for :fosters
  passwordless_for :fosters, at: '/', as: :auth

  post 'signup', to: 'signups#create', as: :signup
  get 'signup', to: 'signups#new', as: :new_signup

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root "fosters#index" # CHANGE THIS
end
