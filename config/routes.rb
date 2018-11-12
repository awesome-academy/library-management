Rails.application.routes.draw do
  root "static_pages#home"
  get "/books", to: "books#index"
  get "/book", to: "books#show"
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
end
