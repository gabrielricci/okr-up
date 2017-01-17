Rails.application.routes.draw do
  resources :weekly_progresses
  resources :key_results
  resources :objectives
  resources :organizations
  root 'organizations#index'
end
