Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/show'

  get 'orders/create'

  resources :users, :only => [:show]

  resources :products, :only => [:show, :index]

  resources :orders, :only => [:create, :show, :index]

  resources :order_details, :only => [:create, :show]

end
