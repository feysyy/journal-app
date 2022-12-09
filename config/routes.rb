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

  # get '/categories/:category_id/tasks', to: "tasks#index", as: "category_tasks"
  # post '/categories/:category_id/tasks', to: "tasks#create"
  # get '/categories/:category_id/tasks/new', to: "tasks#new", as: 'new_category_task'
  # get '/categories/:category_id/tasks/:id/edit', to: "tasks#edit", as: 'edit_category_task'
  # get '/categories/:category_id/tasks/:id', to: "tasks#show", as: 'category_task'
  # patch '/categories/:category_id/tasks/:id', to: "tasks#update"
  # delete '/categories/:category_id/tasks/:id', to: "tasks#destroy"

  # categories routes

  # get '/categories', to: "categories#index", as: 'categories'
  # post '/categories', to: "categories#create"
  # get '/categories/new', to: "categories#new", as: 'new_category'
  # get '/categories/:id/edit', to: "categories#edit", as: 'edit_category'
  # get '/categories/:id', to: "categories#show", as: 'category'
  # patch  '/categories/:id', to: "categories#update"
  # delete '/categories/:id', to: 'categories#destroy'
end
