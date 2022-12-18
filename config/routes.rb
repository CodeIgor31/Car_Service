Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :session, only: %i[new create destroy]
  resources :users
  root 'pages#about', as: 'home'
  get 'sessions/new', as: 'login'
  get 'users/index', as: 'all'
  get 'signings/services', as: 'service'
  get 'pages/gallery', as: 'photo'
  get 'pages/contacts', as: 'contacts'
  get 'signings/sign', as: 'zap'
  post 'signings/create_sign'
  post 'consultations/consult_response'
  get 'masters/show', as: 'masters'
  get 'works/prom', as: 'prom'
  get 'works/main', as: 'work'
  post 'works/test_page', as: 'worktest'
  get 'consultations/index', as: 'consult'
  get 'my_services/show', as: 'records'
  get 'reviews/show', as: 'comm'
  post 'reviews/new'
  post 'users/update'
  get 'pages/guarantee', as: 'garant'
end
