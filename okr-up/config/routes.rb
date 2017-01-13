Rails.application.routes.draw do
  resources :key_results
  resources :objectives
  resources :organizations
  root 'organizations#index'
end
