Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
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
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  # namespace :public do
    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    patch 'customers/onformation' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'
  # end
  
  
    # resources :items, only: [:index, :show] 
    get '/items' => 'public/items#index', as: 'items'
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
