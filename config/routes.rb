Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, :controller => "friend"
  devise_for :users
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  #get 'friends', to: 'friend#index'
  #delete 'friends/:id', to: 'friend#unfriend'
end
