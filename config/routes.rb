Rails.application.routes.draw do
  root "static_pages#home"
  get "/book/:id", to: "books#show",as: "book_show"
  namespace :admin do
    root to: "statistic#index"
    resources :users do
      member do
        post "/update_role", to: "users#update_role"
      end
    end
    resources :publisher, except: %i(new edit show)
    resources :author, except: %i(new edit show)
    resources :categories
    resources :books
    resources :borrows, only: %i(index update)
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :borrow, except: %i(new edit update)
  resources :books, only: %i(index)
  resources :category, only: %i(show)
  resources :author, only: %i(show)
  resources :publisher, only: %i(show)
  post "cart/add/:id" => "cart#add", :as => "cart_add"
  delete "cart/remove(/:id(/:all))" => "cart#delete", :as => "cart_delete"
end

