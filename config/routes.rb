Rails.application.routes.draw do
  devise_for :users
  root :to => 'messages#index'
  get 'message' => 'messages#index'
end
