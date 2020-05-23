Rails.application.routes.draw do
  devise_for :customers, path: 'customer/users', controllers: {registrations: 'customers/registrations'}
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :categories
    resources :products
  end

  namespace :customer do
    get 'orders/index'
    root 'orders#index'

    resources :edit_profile, only: [:edit, :update]
    resources :free_checkout, only: [:show]
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
