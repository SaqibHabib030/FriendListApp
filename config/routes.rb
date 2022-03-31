Rails.application.routes.draw do

  devise_for :users
  root 'friends#index'
  get 'home/about'
  resources :home
  resources :friends do
    collection { post :import }
  end
end
