Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  get 'products/search'
  resources :products do 
    resources :orders, only: [:index, :new, :create]
  end
end
