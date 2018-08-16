Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount Shrine.presign_endpoint(:cache) => "/presign"
  get '/signed_url', to: 'signed_url#signed_url'
  get 'dashboard', to: 'users#dashboard', as: :dashboard

  resources :questions, only: [:new, :create, :destroy] do
    resources :answers, only: [:new, :create]
  end

  post 'step/:step_id/questions', to: 'questions#create'


  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show], path: '', param: :name do
    resources :tutorials do
      resources :steps, only: [:new, :create, :destroy, :edit, :update]
    end
  end

  resources :companies, except: [:show] do
    resources :users, only: [:destroy]
    patch 'companies/:company_id/users/:user_id/make_manager', to: 'users#make_manager', as: :make_manager
  end
  devise_for :users, controllers: { invitations: 'users/invitations' }


end
