Rails.application.routes.draw do
  devise_for :users, only: []
  namespace :v1, defaults: {format: :json} do
    mount_devise_token_auth_for 'User', at: 'auth',
      controllers: {registrations: 'v1/users',
                    sessions: 'v1/sessions'}
    resources :devices
    resources :metricses, only: [:create]
    resources :users, only: [:create]
  end
end
