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


  namespace :owner do
    resources :rounds, only: [] do
      resources :audiences, only: [:index]
    end
  end

  resources :rounds do
    resources :audiences, only: [:new, :create]
  end

  # Defines the root path route ("/")
  root "contestants#index"
end
