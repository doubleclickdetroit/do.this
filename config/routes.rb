App::Application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :entities, only: [:create, :update, :destroy]
end
