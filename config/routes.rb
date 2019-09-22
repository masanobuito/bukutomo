Rails.application.routes.draw do
  namespace :admins do
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  namespace :users do
    get 'yomitais/index'
  end
  namespace :users do
    get 'favorites/index'
  end
  namespace :users do
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
      resource :yomitais, only: [:index, :create, :destroy]
    end
  end
  # resources :users

  namespace :users do
    get "index" => "users#index", as: "index"
    get "" => "users#show", as: "show"
    get "search" => "users#search", as: "search"
  end


  namespace :users do
    get 'homes/index'
  end


  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions' ,
    :passwords => 'admins/passwords',
    :registrations => 'admins/registrations'
  }
  devise_for :users, :controllers => {
    :sessions => 'users/sessions' ,
    :passwords => 'users/passwords',
    :registrations => 'users/registrations'
  }

  root "users/homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end