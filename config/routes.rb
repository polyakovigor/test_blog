Rails.application.routes.draw do
  root 'categories#index'
  resources :categories do
    resources :posts, only: [:new, :create, :destroy]
  end
  resources :posts, except: [:new, :create, :destroy]

  mount ActionCable.server => '/cable'
end
