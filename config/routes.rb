Rails.application.routes.draw do  
  root to: "books#home"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'  
  devise_for :admins  
  devise_for :customers, controllers: { omniauth_callbacks: "customers/omniauth_callbacks" }      
  
  resources :orders
  resources :order_items, except: [:create]
  post 'add_to_order/:book_id', to: 'order_items#create', as: 'order_item_create'
  get 'clear_cart', to: 'order_items#clear_cart'  
  resources :order_steps  
  resources :delivaries
  resources :credit_cards
  resources :addresses
  resources :countries  
  resources :books, only: [:index, :show] do
    resources :ratings, only: [:new, :create]
  end  
  resources :authors
  resources :categories  
  resources :customers
  
end
