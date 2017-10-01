Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root :to => 'groups#index'
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages, only: [:index, :new, :create, :edit, :update]
  end
end
