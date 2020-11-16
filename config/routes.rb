Rails.application.routes.draw do
  get 'home/index'
  resources :users,       only: [:new, :create, :show]
  resources :packages,       only: [:new, :create]
end
