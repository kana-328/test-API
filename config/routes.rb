Rails.application.routes.draw do
  get 'home/index'
  resources :packages,       only: [:new]
end
