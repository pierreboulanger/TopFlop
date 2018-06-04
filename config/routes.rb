Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :teams do
    resources :users
    resources :games do
      resources :tops, only: [:new, :create, :edit, :update]
      resources :flops, only: [:new, :create, :edit, :update]
    end
  end

end
