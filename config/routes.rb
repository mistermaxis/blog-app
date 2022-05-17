Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :index, :show, :create] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
