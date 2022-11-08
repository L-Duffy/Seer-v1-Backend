Rails.application.routes.draw do
  resources :images
  resources :tags
  resources :image_tags

  # User routes
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
