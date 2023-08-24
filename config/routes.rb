Rails.application.routes.draw do
  
  # User
  get "/users/all" => "users#index"
  get "/user/:id" => "users#show"
  post "/tambahuser" => "users#create"
  post "/updateuser" => "users#update"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  # User_Role
  get "/roles/all" => "user_roles#index"
  get "/role/:id" => "user_roles#show"
  post "/tambahrole" => "user_roles#create"
  post "/updaterole" => "user_roles#update"
  resources :user_roles

  # Modul
  get
  get
  post 
  post
  resources :moduls

  # Akses Modul
  
end
