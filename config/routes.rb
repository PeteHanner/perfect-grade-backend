Rails.application.routes.draw do
  get '/assignments/first', to: 'assignments#first_request'
  get '/assignments/fresh', to: 'assignments#fresh_request'
  resources :assignments
  resources :courses
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
