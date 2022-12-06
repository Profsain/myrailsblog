Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]

  root 'users#index'
end
