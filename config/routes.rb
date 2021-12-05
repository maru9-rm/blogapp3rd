Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resource :timeline, only: [:show]

  resources :articles do
    resources :comments, only: [:index, :new, :create]
    resource :like, only: [:show, :create, :destroy]
  end

  resource :profile
  resources :favorites, only: [:index]
  

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end


end
