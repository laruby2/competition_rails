Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :contestants do
    resources :votes
  end

  resources :users, only: [:new, :create]
  get "register" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  get "admin" => "admin/dashboard#index"

  # Defines the root path route ("/")
  root "contestants#index"
end
