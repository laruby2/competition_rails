Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :contestants, only: [:index] do
    resources :votes
  end

  resources :users
  get "register" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  namespace :admin do
    resources :contestants
  end
  get "results" => "admin/dashboard#index"

  resources :rounds

  # Defines the root path route ("/")
  root "contestants#index"
end
