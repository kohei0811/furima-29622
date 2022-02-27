Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'product_details#index'
  resources :users, only: :index
  resources :product_details, only: [:index, :new, :create]
end
