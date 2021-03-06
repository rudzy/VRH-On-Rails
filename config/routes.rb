Rails.application.routes.draw do

  devise_for :admins

  root "public#index"

  resources :public, only: [:index] do
    collection do
      get :about
      get :contact
    end
  end

  resources :games do
    post :score, on: :member
    delete :delete_goal, on: :member
  end

  resources :partners
  resources :articles
  resources :players
  resources :ranks
  resources :teams
  resources :seasons
  resources :championships

  devise_for :users
  match '/users',   to: 'users#index',   via: 'get'
end
