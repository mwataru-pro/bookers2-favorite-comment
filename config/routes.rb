Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'

  devise_for :users
  
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:create,:show, :index,:edit,:update,:destroy] do
  	resource :favorites, only: [:create,:destroy]
  	resources :book_comments, only: [:create,:destroy]
  end
end
