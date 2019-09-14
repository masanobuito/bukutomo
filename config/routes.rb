Rails.application.routes.draw do
  namespace :users do
    get 'yomitaies/index'
  end
  namespace :users do
    get 'favorites/index'
  end
  namespace :users do
    get 'posts/index'
    get 'posts/edit'
    get 'posts/new'
    get 'posts/show'
  end
  namespace :users do
    get 'users/index'
    get 'users/show'
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