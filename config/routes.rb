Rails.application.routes.draw do
  root 'static_pages#index'

  resources :users, controller: 'users', only: Clearance.configuration.user_actions
end
