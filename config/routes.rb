# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'home#index'

  get 'chemical_orders', to: 'purchase_orders#chemical_index'
  get 'expendables_orders', to: 'purchase_orders#expendable_index'
  get 'search_index', to: 'purchase_orders#search_index'

  resources :purchase_orders do
    resources :comments
    resources :chemicals, controller: 'items', type: 'Chemical'
    resources :expendables, controller: 'items', type: 'Expendable'
  end

  resources :expendables, controller: 'items', type: 'Expendable' do
    resources :comments
  end

  resources :chemicals, controller: 'items', type: 'Chemical' do
    resources :comments
  end

  resources :user_orders
end
