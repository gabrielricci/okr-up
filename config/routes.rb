Rails.application.routes.draw do
  resources :weekly_progresses, only: [:new, :edit, :create, :update]
  resources :key_results, only: [:new, :edit, :create, :update, :destroy]
  resources :objectives
  resources :organizations
  root 'objectives#index'
end
