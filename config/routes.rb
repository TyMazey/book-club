Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing_page#index'
  resources :books do
    resources :reviews, shallow: true
  end
  resources :books
  resources :authors, only: [:show]
  resources :users, only: [:show]
end
