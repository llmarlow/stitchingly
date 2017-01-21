Rails.application.routes.draw do
  resources :user_flosses
  resources :flosses 
  devise_for :users 
  
  resources :users do
    resources :projects
  end
  root 'pages#home'
  get '/projects', to: 'projects#all', as: 'projects'
end
