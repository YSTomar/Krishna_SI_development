SiDevelopment::Application.routes.draw do

  resources :presentations
  resources :webnairs
  
  captcha_route
  resources :welcomes

  devise_for :users
  get "/users/sales_host"
  post "/users/sales_host"
  get "/users/client_user"
  post "/users/client_user"
  get "/presentations/show"
  root "users#index"


  #resources :security_questions
      
    
end
