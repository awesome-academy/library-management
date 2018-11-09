Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      member do
        post "/update_role", to: "users#update_role"
      end
    end
    resources :publisher, except: %i(new edit show)
    resources :author, except: %i(new edit show)
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
end
