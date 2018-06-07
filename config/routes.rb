Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'pages#home'

  resources :players

  resources :teams do
    resources :games do
      resources :tops, only: [:index, :new, :create, :edit, :update]
      resources :flops, only: [:index, :new, :create, :edit, :update]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :teams, only: [ :index, :show ]
    end
  end

end
