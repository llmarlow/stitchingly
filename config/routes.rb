Rails.application.routes.draw do

  
  root 'pages#home'
  resources :sals do 
    collection do
      get 'archive'
    end
    resources :releases
  end
  resources :tags
  resources :features do
    member do
      put "like", to: "features#upvote"
      put "dislike", to: "features#downvote"
    end
  end

  get '/about', to: 'pages#about', as: 'about'
  devise_for :users 
  resources :user_flosses
  resources :flosses do
    member do
      put "increase", to: "flosses#increase"
      put "decrease", to: "flosses#decrease"
    end
  end
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

  get "/flosses/increase_with_jquery/:id", to: "flosses#increase_with_jquery"
  get "/flosses/decrease_with_jquery/:id", to: "flosses#decrease_with_jquery"
end
