Rails.application.routes.draw do


  authenticated :user do
    root to: 'pages#home'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :series
  resources :episodes
  resources :characters
  resources :relationships
  resources :users, only: [:index]
  resources :series_requests, only: [:create, :edit, :update]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret'}
end
