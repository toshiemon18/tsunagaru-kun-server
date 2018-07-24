Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  devise_for :users, only: []
  namespace :v1, defaults: {format: :json} do
    resource :login, only: [:create], controller: :sessions
    resources :devices
    resources :users, only: [:create]
  end
end
