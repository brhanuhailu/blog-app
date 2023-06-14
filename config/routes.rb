Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  resources :posts, only: [:new, :create] do
    resources :likes, only: [:create]
    resources :comments, only: [:create]
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
