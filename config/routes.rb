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

resources :customers

resources :sessions, only: [:new, :create, :destroy]
get 'pages/landing' => 'pages#landing'


end
