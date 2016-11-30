Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :teams do
    resources :users
    resources :games do
      resources :top
      resources :flop
    end
  end

end
