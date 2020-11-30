Rails.application.routes.draw do
  root to: "home#index"
  resources :sessions, only: [:new, :create, :destroy]
  resources :photographers,  only: [:new, :create, :show, :edit, :update] do
    resources :packages,       only: [:new, :create, :show, :edit, :update, :destroy]do
      collection do
        get 'get_cities' 
      end
    end
  end
end
