Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy], :controller => "friend"
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'friend#search_friend'
  get 'friends', to: 'friend#index'
  resources :users, only: [:show]
  #delete 'friends/:id', to: 'friend#unfriend'
end
