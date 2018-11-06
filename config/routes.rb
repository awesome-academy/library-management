Rails.application.routes.draw do
  root "books#index"
  resources :categories
  resources :books
  get "book/show"

  devise_for :users
end
