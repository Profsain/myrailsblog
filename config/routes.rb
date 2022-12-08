Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:index, :show, :destroy]
    end
  end

  resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]

  namespace :api do
    post :auth, to: "authentication#create"
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
      end
    end
  end

  root 'users#index'
end
