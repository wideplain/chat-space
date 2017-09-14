Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root :to => 'messages#index'
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :messages
  end

end
