# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'posts#index'

  resources :posts
  post '/', to: 'posts#create'

  resources :users do
    resources :friendships, only: %i[new create destroy index update] do
      post 'accept', to: 'friendships#update'
      delete 'decline', to: 'friendships#destroy'
    end
  end

  resources :comments, only: %i[new create show]
  resources :likes, only: %i[new create show]

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
  end

end
