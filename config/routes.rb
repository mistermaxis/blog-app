Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  get '/users/:user_id/posts/:post_id/destroy_comment', to: 'comments#destroy', as: 'destroy_comment' # destroy
  post '/users/:user_id/posts/:post_id/destroy_comment', to: 'comments#destroy' # destroy

end
