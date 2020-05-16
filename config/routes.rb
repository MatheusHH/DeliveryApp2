Rails.application.routes.draw do
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :categories
    resources :products
  end
  
  namespace :site do
    get 'shoppings/index'
  end
  
  root 'site/shoppings#index'
end
