Lineup4::Application.routes.draw do


  get "comments/new"
  get "comments/create"
  get "comments/edit"
  get "comments/update"
  get "comments/destroy"
root 'pages#home'

  get "pages/show"
  get "pages/following"

resources :barbers do
  resources :portfolios do 
    post 'like',   to: 'socializations#like'
    post 'unlike', to: 'socializations#unlike'
  	resources :comments
	end
end

resources :customers do
  resources :portfolios do 
    post 'like',   to: 'socializations#like'
    post 'unlike', to: 'socializations#unlike'
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

resources :barbers do 
  resources :pages do 
end
end 

resources :customers do 
  resources :pages do 
end
end 


resources :customers do
  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
  post 'like',   to: 'socializations#like'
  post 'unlike', to: 'socializations#unlike'
end

resources :barbers do
  post 'follow',   to: 'socializations#follow'
  post 'unfollow', to: 'socializations#unfollow'
  post 'like',   to: 'socializations#like'
  post 'unlike', to: 'socializations#unlike'
end

resources :customers

resources :sessions, only: [:new, :create, :destroy]
get 'pages/landing' => 'pages#landing'


end
