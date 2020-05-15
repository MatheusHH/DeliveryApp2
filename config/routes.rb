Rails.application.routes.draw do
  devise_for :users, path: 'admin/users'
  namespace :admin do
    get 'dashboard/index'
    root 'dashboard#index'

    resources :categories
    resources :products
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
