Rails.application.routes.draw do
  resources :projects
  resources :user_flosses
  resources :flosses 
  devise_for :users
  root 'pages#home'
end
