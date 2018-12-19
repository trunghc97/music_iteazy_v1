Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  resources :songs
  resources :singers
  resources :playlists
  resources :playlist_songs
  # get "/signup", to: "users#new"
  # post "/signup", to: "users#create"
  # get "/signup", to: "users#new"
  # post "/signup", to: "users#create"
  # get "/login", to: "sessions#new"
  # post "/login", to: "sessions#create"
  # delete "/logout", to: "sessions#destroy"
  # get "sessions/new"
  resources :users
  resources :singers
  resources :comments, only: %i(create destroy)
  resources :genres
  namespace :admin do
    resources :songs, except: %i(index show)
    resources :comments, except: %i(index show)
  end
  resources :likeds
end
