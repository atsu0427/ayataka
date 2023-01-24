Rails.application.routes.draw do
  devise_for :users
  
  get 'tweets/new' => 'tweets#new'
  get 'tweets/test'=>'tweets#test'
  root 'hello#index'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
end
