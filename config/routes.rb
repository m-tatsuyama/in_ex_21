Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :dashboard, only: [:index, :show] do
    resources :expenses, only: [:new, :create, :edit, :destroy]
    resources :incomes, only: [:new, :create, :edit, :destroy] 
  end
end

