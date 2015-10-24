Rails.application.routes.draw do

  resources :users, :only => [:show]

  resources :products

  resources :orders, :only => [:create, :show, :index, :destroy], :param => :oid

  resources :order_details, :only => [:create, :show]

  root to: 'products#index'

end
