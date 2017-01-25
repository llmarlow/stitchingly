Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users 
  resources :user_flosses
  resources :flosses 
  get '/projects', to: 'projects#all', as: 'projects'
  resources :users, only: [:index, :show, :all] do
    resources :projects
  end

end
