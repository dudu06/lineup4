Lineup4::Application.routes.draw do


  get "comments/new"
  get "comments/create"
  get "comments/edit"
  get "comments/update"
  get "comments/destroy"
root 'pages#home'

resources :barbers do
  resources :portfolios do 
  	resources :comments
	end
end

# # Added this in for socialization gem to work
# resources :customers do
#   member do
#     post :follow
#     end
# end

# # Added this in for socialization gem to work again with barbers
# resources :barbers do
#   member do
#     post :follow
#     end
# end

resources :customers do
  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
end

resources :barbers do
  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
end

resources :customers

resources :sessions, only: [:new, :create, :destroy]
get 'pages/landing' => 'pages#landing'


end
