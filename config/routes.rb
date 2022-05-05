Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :contestants do
    resources :votes
  end

  resources :users
  get "register" => "users#new"

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  get "results" => "admin/dashboard#index"

  # Defines the root path route ("/")
  root "contestants#index"
end
