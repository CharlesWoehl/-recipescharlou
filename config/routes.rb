Rails.application.routes.draw do
  root to: "pages#home"
  get "index", to: "pages#index"
  get "recherche", to: "pages#recherche"
  get "a_propos", to: "pages#apropos"
  resources :categories
  resources :recipes
  get '/random', to: 'recipes#random'

  # Redirection pour la création de compte
  constraints ->(request) { request.path.exclude?('users') } do
    root to: "pages#home" # Redirection vers la page d'accueil pour les requêtes de création de compte
  end


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
