Rails.application.routes.draw do
  devise_for :customers, path: 'customer/users', controllers: {registrations: 'customers/registrations'}
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :categories
    resources :products
    resources :deliveries, only: [:index, :edit, :update, :show]
    resources :customers, only: [:index, :show]
    resources :edit_users, only: [:edit, :update]
  end

  namespace :customer do
    root 'orders#index'
    
    resources :orders, only: [:index, :show]
    resources :edit_profile, only: [:edit, :update]
    resources :free_checkout, only: [:show] do 
      member do
        resources :deliveries, only: [:index, :create]
      end
    end
  end
  
  namespace :site do
    get 'shoppings/index'
    resources :show_product, only: [:show]
    resources :by_category, only: [:show]
    resources :order_items
    resource :carts, only: [:show]
  end
  
  root 'site/shoppings#index'
end
