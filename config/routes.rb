Rails.application.routes.draw do

  get 'dashboard_manager', to: 'users#dashboard_manager', as: :dashboard_manager



  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies, only: [:show], path: '', param: :name

  resources :companies, except: [:show] do
    resources :users, only: [:destroy]
    patch 'companies/:company_id/users/:user_id/make_manager', to: 'users#make_manager', as: :make_manager
    resources :tutorials
  end
  devise_for :users, controllers: { invitations: 'users/invitations' }

end
