Rails.application.routes.draw do

  resources :features do
    member do
      put "like", to: "features#upvote"
      put "dislike", to: "features#downvote"
    end
  end

  root 'pages#home'
  get '/about', to: 'pages#about', as: 'about'
  devise_for :users 
  resources :user_flosses
  resources :flosses 
  resources :fabrics
  get '/projects', to: 'projects#all', as: 'projects'
  get '/projects/dashboard', to: 'projects#dashboard', as: 'dashboard'
  resources :users, only: [:index, :show, :all] do
    resources :projects do
      member do
        put "like", to: "projects#like"
        put "dislike", to: "projects#dislike"
      end
      resources :updates
    end
  end

end
