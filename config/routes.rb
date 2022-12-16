Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :games, only: %i[show new create]
  resources :parties, only: %i[show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
