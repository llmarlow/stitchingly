Rails.application.routes.draw do
  resources :quantities
  devise_for :users
  root 'pages#home'
  get '/flosses', to: 'flosses#index', as: 'flosses'
end
