Rails.application.routes.draw do
  devise_for :users, controllers: { 
     omniauth_callbacks: 'users/omniauth_callbacks',
     registrations: "users/registrations"
  }
  root to: "tops#index"

  get 'musics/index'
  post 'musics/search'
  get "musics/play"
  get "musics/rest" 

  resources :users
end
