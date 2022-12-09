Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    root "categories#index"

  resources :categories do
    resources :tasks
  end


  # tasks routes

  # get '/categories/:category_id/tasks', to: "tasks#index", as: 'new_category_tasks'
  # post '/categories/:category_id/tasks', to: "tasks#create"
  # get '/categories/:category_id/tasks/new', to: "tasks#new"
  # get '/categories/:category_id/tasks/:id/edit', to: "tasks#edit"
  # get '/categories/:category_id/tasks/:id', to: "tasks#show"
  # path '/categories/:category_id/tasks/:id', to: "tasks#update"
  # delete '/categories/:category_id/tasks/:id', to: "tasks#destroy"

  # categories routes

  # get '/categories', to: "categories#index"
  # post '/categories', to: "categories#create"
  # get '/categories/new', to: "categories#new"
  # get '/categories/:id/edit', to: "categories#edit"
  # get '/categories/:id', to: "categories#show"
  # patch  '/categories/:id', to: "categories#update"
  # delete '/categories/:id', to: "categories#destroy"
end
