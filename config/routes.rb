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
  
  scope module: :public do
    
    post 'orders/comfirm' => 'orders#comfirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
  end
  
  
  scope module: :public do
    # 【destroy_all】アクションを実行したら、【destroy】が実行されていた
    # 1.rails routesで表示されたURLは、上から順に読み込まれる。
    # 2.xxx/:idの部分は、数字(/1など)ではなく文字(/destroy_all)も呼び出される。
    # 3.↓の部分で、/destroy_allを下に記述すると、destroyの/cart_item/:idが先に
    #   読まれてしまったため、エラーとなった。
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all' 
    resources :cart_items, only: [:index, :update, :create, :destroy]
    
  end
    # resources :cart_items, only: [:index, :update, :create, :destroy]
    # get    'cart_items' => 'public/cart_items#index'
    # post    'cart_items' => 'public/cart_items#create'
    # patch    'cart_items/:id' => 'public/cart_items#update'
    # delete    'cart_items/:id' => 'public/cart_items#destroy'
  

  
    get 'customers/my_page' => 'public/customers#show'
    get 'customers/information/edit' => 'public/customers#edit'
    patch 'customers/information' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    # ↓ getルーティングも記述する必要があった
    get 'customers/withdraw' => 'public/customers#withdraw'
    patch 'customers/withdraw' => 'public/customers#withdraw'
  

    get '/items' => 'public/items#index', as: 'items'
    # postを作らないと、admin側に影響して更新できない ※追記・formにurlを記述
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
