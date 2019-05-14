Rails.application.routes.draw do
  root to: "tops#index"

  devise_for :users, controllers: { 
     omniauth_callbacks: 'users/omniauth_callbacks',
     registrations: "users/registrations"
  }

  get 'musics/index'
  post 'musics/search'
  get "musics/play"
  get "musics/rest" 
end
