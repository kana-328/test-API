Rails.application.routes.draw do
  get 'photographers/new'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  resources :users,          only: [:new, :create, :show]
  resources :packages,       only: [:new, :create]
  resources :photographers,  only: [:new, :create, :show]
end
