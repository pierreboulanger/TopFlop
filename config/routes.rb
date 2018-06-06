Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "registrations" }
  root to: 'pages#home'

  resources :players

  resources :teams do
    resources :games do
      resources :tops, only: [:index, :new, :create, :edit, :update]
      resources :flops, only: [:index, :new, :create, :edit, :update]
    end
  end

end
