Rails.application.routes.draw do
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :categories
    resources :products
  end

  get 'shoppings/index'
  root 'shoppings#index'
end
