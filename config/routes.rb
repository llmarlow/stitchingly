Rails.application.routes.draw do
  
  devise_for :users 

  resources :user_flosses
  resources :flosses 
  root 'pages#home'
  get '/projects', to: 'projects#all', as: 'projects'
  resources :users do
    resources :projects
  end
end
