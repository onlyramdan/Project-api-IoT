Rails.application.routes.draw do
  resources :monitorings
  
  # User
  get "/users/all" => "users#index"
  get "/user/:id" => "users#show"
  get "/show_role" => "users#show_role"
  post "/tambahuser" => "users#create"
  post "/updateuser" => "users#update"
  post "/hapususer/:id" => "users#destroy" # Delete
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
  post "/tambahmodul" => "moduls#create"
  post "/updatemodul" => "moduls#update"
  get "/moduls/all" => "moduls#index"
  get "/modul/:id" => "moduls#show"
  resources :moduls
  
  # Akses Modul
  post "/tambah/aksesmodul" => "akses_moduls#create"
  post "/update/aksesmodul" => "akses_moduls#update"
  get "/aksesmoduls/all" => "akses_moduls#index"
  get "/aksesmodul/:id" => "akses_moduls#show"
  resources :akses_moduls
  
  #Alat
  post "/tambahalat" => "alats#create" #Create
  post "/updatealat" => "alats#update" #Update
  get "/alats/all" => "alats#index" # Read All
  get "/alat/:id" => "alats#show" # Read by Id
  post "/hapusalat/:id" => "alats#destroy" # Delete
  resources :alats

  # Monitoring
  post "/tambah/monitoring" => "monitorings#create"
  get "/monitoring/all" => "monitorings#index"
  get "/alat_monitoring/:alat_id" => "monitorings#show_monitoring"
  resources :monitorings

  #login
  post "/login" => "login#login"
  resources :login
end
