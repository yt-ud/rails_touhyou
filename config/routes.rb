Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :candidates
  resources :elections
  resources :myelections

  root to: "elections#index" 
  post "/login", to: "sessions#create", as: "login"
  delete "/logout", to: "sessions#destroy", as: "logout"
end
