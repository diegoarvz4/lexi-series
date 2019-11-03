Rails.application.routes.draw do

  get 'quality_controls/new'
  get 'quality_controls/create'
  get 'quality_controls/edit'
  get 'quality_controls/update'
  get 'quality_controls/destroy'
  get 'quality_controls/show'
  get 'quality_controls/index'
  authenticated :user do
    root to: 'pages#home'
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :roles, only: [:create]
  resources :series
  resources :episodes
  resources :characters
  resources :relationships
  resources :users, only: [:index, :show]
  resources :series_requests, only: [:create, :edit, :update]
  devise_for :users, path: '', 
                     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret' }, 
                     controllers: { registrations: 'registrations' }
  resources :translations
  resources :quality_controls
end
