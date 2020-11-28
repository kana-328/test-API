Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
  resources :photographers,  only: [:new, :create, :show, :edit, :update] do
    resources :packages,       only: [:new, :create, :show, :edit, :update, :destroy]do
      collection do
        get 'get_cities' 
      end
    end
  end
end
