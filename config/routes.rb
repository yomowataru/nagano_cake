Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
  end
  namespace :admin do
    resources :items
    # post '/items' => 'admin/items#index'

    # get 'items/index'
    # get 'items/new'
    # get 'items/show'
    # get 'items/edit'
  end
  namespace :admin do
    # get 'homes/top'
    root to: 'homes#top'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  
  
  scope module: :public do
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all' 
  end
    # resources :cart_items, only: [:index, :update, :create, :destroy]
    # get    'cart_items' => 'public/cart_items#index'
    # post    'cart_items' => 'public/cart_items#create'
    # patch    'cart_items/:id' => 'public/cart_items#update'
    # delete    'cart_items/:id' => 'public/cart_items#destroy'
     
    # get 'cart_items/index'
    # get 'cart_items/update'
    # get 'cart_items/destroy'
    # get 'cart_items/destroy_all'
    # get 'cart_items/create'
  

  
    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    patch 'customers/information' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    # ↓ getルーティングも記述する必要があった
    get 'customers/withdraw' => 'public/customers#withdraw'
    patch 'customers/withdraw' => 'public/customers#withdraw'
  

    get '/items' => 'public/items#index', as: 'items'
    # postを作らないと、admin側に影響して更新できない ※追記・formにurlを記述することで
    # post '/items' => 'public/items#index'
    get '/items/:id' => 'public/items#show', as: 'item'

    root to: 'public/homes#top'
    get '/about' => 'public/homes#about', as: 'about'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
