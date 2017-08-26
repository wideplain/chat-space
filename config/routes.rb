Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:edit, :update]
  root :to => 'messages#index'
  get 'message' => 'messages#index'
end
