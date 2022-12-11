Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users
  root 'pages#about', as: 'home'
  get 'sessions/new', as: 'login'
  get 'users/index', as: 'all'
  get 'pages/services', as: 'service'
  get 'pages/gallery', as: 'photo'
  get 'pages/contacts', as: 'contacts'
  get 'pages/busket', as: 'busk'
end
