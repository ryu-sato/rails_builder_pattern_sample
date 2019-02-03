Rails.application.routes.draw do
  root 'logs#index'
  resources :processed_logs
  resources :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
