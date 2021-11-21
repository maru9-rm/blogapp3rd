Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles

  resource :profile, only: [:show, :edit, :update]

end
