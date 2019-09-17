Rails.application.routes.draw do
 

    
  resources :pens
  # namespace :api, defaults: {format: :json} do
  #     namespace :v1 do
  #       resources :users
  #     end
  #   end
  
  Rails.application.routes.draw do
  resources :pens
  resources :cars, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  end
  
  # static pages controller routes 
  root "static_pages#home"
 
  get '/help', to: 'static_pages#help'

  get '/about', to:'static_pages#about'
  
  get '/contact', to: 'static_pages#contact'
  
  
  
  
  get '/signup', to: 'users#new'
  
  post '/signup',  to: 'users#create'
   
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
    resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
