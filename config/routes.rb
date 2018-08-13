Rails.application.routes.draw do

  get 'dashboard', to: 'users#dashboard', as: :dashboard

  resources :questions, only: [:new, :create]

  post 'step/:step_id/questions', to: 'questions#create'



  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show], path: '', param: :name do
    resources :tutorials, only: [:show]
  end

  resources :companies, except: [:show] do
    resources :users, only: [:destroy]
    patch 'companies/:company_id/users/:user_id/make_manager', to: 'users#make_manager', as: :make_manager
  end
  devise_for :users, controllers: { invitations: 'users/invitations' }

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
