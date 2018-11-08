Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      member do
        post "/update_role", to: "users#update_role"
      end
    end
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
end
