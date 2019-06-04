Rails.application.routes.draw do
  root 'logs#index'
  resources :processings, only: [:new, :create]
  resources :processed_logs
  resources :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
