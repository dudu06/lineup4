Lineup4::Application.routes.draw do


root 'pages#home'

resources :barbers do
  resources :portfolios
end

resources :customers

resources :sessions, only: [:new, :create, :destroy]
get 'pages/landing' => 'pages#landing'


end
