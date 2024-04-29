# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  root to: 'items#index'

  resources :items
  resources :tasks
  resources :carts, param: :item_id

  # delete '/delete_item', to: 'carts#delete_item'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
