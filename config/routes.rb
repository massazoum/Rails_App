Rails.application.routes.draw do
  root 'users#index'

  # Users routes
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: :user

  # User posts routes
  get '/users/:user_id/posts', to: 'posts#index', as: :user_posts
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post

# Route for handling the GET request to "/likes/new"
# get '/likes/new', to: 'likes#new', as: :new_like

  resources :posts do
    resources :likes, only: [:create] # Nested route for creating likes for a post
  end
  # Create new post, comment, and like routes
  # resources :posts, only: [:new, :create]
  resources :comments, only: [:new, :create]
  # resources :likes, only: [:create]
end
