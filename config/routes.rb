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
  get "musics/history"

  resources :users
  resources :posts
  resources :music_histories, only: %i[create]
  resources :post_favorites, only: %i[create destroy]

  namespace :admin do
    resources :users
  end
end
