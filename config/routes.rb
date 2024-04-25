Rails.application.routes.draw do
  root to: 'rooms#index'
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:update] do
    collection do
      get 'account'
      get 'profile'
      get 'edit_account'
      get 'edit_profile'
    end
  end

  resources :rooms, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
      get 'own'
    end
  end

  resources :reservations, only: [:index, :create] do
    collection do
      get 'confirmation'
      post 'confirm'
    end
  end
end
