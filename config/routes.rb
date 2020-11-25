Rails.application.routes.draw do
  get 'photographers/new'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  resources :users,          only: [:new, :create, :show]
  resources :photographers,  only: [:new, :create, :show, :edit] do
    resources :packages,       only: [:new, :create]
  end
end
