Rails.application.routes.draw do
  get 'tutorials/index'
  get 'tutorials/show'
  get 'tutorials/destroy'
  get 'tutorials/new'
  get 'tutorials/create'
  get 'tutorials/edit'
  get 'tutorials/update'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies
end
