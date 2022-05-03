Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :contestants do
    resources :votes
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

  # Defines the root path route ("/")
  root "contestants#index"
end
