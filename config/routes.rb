Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  resources :users
  get 'login', to: 'sessions#new' 
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :articles
  resources :categories
  resources :votes, only: [:create]

  mount Shrine.presign_endpoint(:cache) => "/s3/params"
end
