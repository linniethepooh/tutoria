Rails.application.routes.draw do

  devise_for :users, controllers: { invitations: 'users/invitations' }

  get 'tutorials/index'
  get 'tutorials/show'
  get 'tutorials/destroy'
  get 'tutorials/new'
  get 'tutorials/create'
  get 'tutorials/edit'
  get 'tutorials/update'

  get 'dashboard_manager', to: 'users#dashboard_manager', as: :dashboard_manager


  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :users, only: [:destroy]
      patch 'companies/:company_id/users/:user_id/make_manager', to: 'users#make_manager', as: :make_manager
  end

end
