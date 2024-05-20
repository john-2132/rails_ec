# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products
    resources :orders
  end

  root to: 'items#index'

  resources :items
  resources :tasks
  resources :carts, param: :item_id

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
