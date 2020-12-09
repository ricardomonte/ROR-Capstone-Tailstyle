Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "categories#index"
  resources :users
  get 'login', to: 'sessions#new' 
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :articles
  get 'nutrition', to: 'categories#nutrition'
  get 'healthy_life', to: 'categories#healthy_life'
  get 'grooming', to: 'categories#grooming'
  get 'entertainment', to: 'categories#entertainment'
end
