Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root 'logs#index'
  resources :processings, only: [:new, :create]
  resources :processed_logs
  resources :logs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    only: [:sessions],
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }
end
