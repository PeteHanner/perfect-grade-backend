# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "/assignments/first", to: "assignments#first_request"
  get "/assignments/fresh", to: "assignments#fresh_request"
  resources :assignments, only: [:index, :create, :update, :destroy]
  resources :courses, only: [:index, :create, :update, :destroy]
  resources :users, only: [:create, :update, :destroy]
  post "/login", to: "auth#login"
  get "/profile", to: "users#profile"
end
