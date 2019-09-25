Rails.application.routes.draw do
  namespace :admins do
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  # 開発中に一覧ページはいらないかなーと思ったので削除
  # namespace :users do
  #   get 'yomitais/index'
  # end
  # namespace :users do
  #   get 'favorites/index'
  # end

  namespace :users do
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resource :yomitais, only: [:create, :destroy]
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

  # 自前のDeviseControllerを使うよう指示(知らない人のURL直打ちでの管理者登録を防止するためにpath: :admins_193でURLをadmins_193に変更している)
  devise_for :admins, path: :admins_193, :controllers => {
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

  # お問い合わせフォーム
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end