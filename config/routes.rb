Rails.application.routes.draw do

 
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  # devise_for :controllers
  # namespace :admin_pannel do
  #   resources :categories
  #   resources :products
  # end
  

  # resources :products
  resources :products do
    member do
      get 'show_product'
    end
  end
  get '/products/search', to: 'products#search'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/me', to: 'pages#me'
 
  devise_scope :user do
    get '/admin', to: 'admin/sessions#new'
    end
    
    get '/admin/categories', to: 'categories#index'
    get '/admin/products', to: 'products#index'
    resources :users, only: [:index,:edit,:show,:update]
    get 'categories/:id/products', to: 'categories#category_products', as: 'category_products'

    get 'carts/:id' => "carts#show", as: "cart"
    delete 'carts/:id' => "carts#destroy"
    
    post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
    post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
    post 'line_items' => "line_items#create"
    get 'line_items/:id' => "line_items#show", as: "line_item"
    delete 'line_items/:id' => "line_items#destroy"
    resources :orders

   
end
