Rails.application.routes.draw do
  root :to => 'messages#index'
  get 'message' => 'messages#index'
end
