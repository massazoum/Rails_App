Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/about', to: 'about#index'
end




# Rails.application.routes.draw do
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   resources :users, only: [:index, :show] do
#     resources :posts, only: [:index, :show]
#   end
# end