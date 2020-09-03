Rails.application.routes.draw do
  get 'products/index'
  root to: "products#index"
  devise_for :users
end
