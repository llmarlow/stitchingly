Rails.application.routes.draw do
  root 'pages#home'
  get '/flosses', to: 'flosses#index', as: 'flosses'
  
end
