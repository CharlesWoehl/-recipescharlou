Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "index", to: "pages#index"
  get "recherche", to: "pages#recherche"
  get "a_propos", to: "pages#apropos"
  resources :categories, param: :id do
    get ':name', action: :show, on: :member
  end
  resources :recipes, param: :name
  get '/random', to: 'recipes#random'

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
