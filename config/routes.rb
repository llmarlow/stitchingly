Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get '/flosses', to: 'flosses#index', as: 'flosses'
end
