Rails.application.routes.draw do

  root 'users#index'
  # Users routes
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :user

  # User posts routes
  get '/users/:user_id/posts', to: 'posts#index', as: :user_posts
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post
end
