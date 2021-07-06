Rails.application.routes.draw do

  get '/search' => 'searches#search'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites,only: [:create, :destroy]

    resources :book_comments, only: [:create, :destroy]
  end

  root 'homes#top'
  get 'home/about' => 'homes#about'

end