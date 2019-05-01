# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'home#index'

  resources :purchase_orders do
    resources :comments
    resources :chemicals, controller: 'items', type: 'Chemical'
    resources :expendables, controller: 'items', type: 'Expendable'
  end

  resources :user_orders
end
