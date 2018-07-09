Rails.application.routes.draw do
  devise_for :users, only: []
  namespace :v1, defaults: {format: :json} do
    resource :login, only: [:create], controller: :session
    resources :devices
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
