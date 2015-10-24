Rails.application.routes.draw do

  resources :users, :only => [:show]

  resources :products, :only => [:show]

  resources :orders, :only => [:create, :show, :update]

  resources :order_details, :only => [:create, :show]

end
