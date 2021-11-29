Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resource :timeline, only: [:show]

  resources :articles do
    resources :comments, only: [:new, :create]
    resource :like, only: [:create, :destroy]
  end

  resource :profile
  resources :favorites, only: [:index]
  

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


end
