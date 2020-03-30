Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'
  resources :users, only: [:show, :edit,:update]
  get 'followings', to: 'users#followings'
  get 'unfollow', to: 'users#unfollow'
  resources :posts, only: [:new,:create, :destroy] do 
    resources :comments, only: [:create, :edit, :update ]
  end
  get 'posts/:id', to: 'posts#current_post'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
