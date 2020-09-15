Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: "products#index"
  resources :products
  resources :orders, only: [:index]
end
