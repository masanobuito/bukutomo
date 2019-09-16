Rails.application.routes.draw do
  namespace :users do
    get 'yomitaies/index'
  end
  namespace :users do
    get 'favorites/index'
  end
  namespace :users do
    resources :posts do
      resources :post_comments
      resource :favorites, only: [:index, :create, :destroy]
      resource :yomitais, only: [:index, :create, :destroy]
    end
  end
  resources :users


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