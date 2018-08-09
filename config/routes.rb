Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :tutorials
  end
  devise_for :users, controllers: { invitations: 'users/invitations' }
end
