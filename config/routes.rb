Rails.application.routes.draw do
  resources :user_flosses
  resources :flosses 
  devise_for :users
  root 'pages#home'
  get '/test', to: 'flosses#test', as: 'test'
end
