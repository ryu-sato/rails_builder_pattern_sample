Rails.application.routes.draw do
  devise_for :users
  root 'logs#index'
  resources :processings, only: [:new, :create]
  resources :processed_logs
  resources :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
