Rails.application.routes.draw do
  root 'messages#index'

  resources :users, controller: 'users', only: Clearance.configuration.user_actions
  # resource :messages

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :messages, only: %i(index show)
      resources :contacts, only: %i(index show)
    end
  end
end
