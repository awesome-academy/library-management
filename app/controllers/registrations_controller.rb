class RegistrationsController < Devise::RegistrationsController
  layout "devise"
  before_action :configure_permitted_parameters, :only => [:create]

  def create
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer
      .permit :sign_up, keys: [:username, :email, :password]
    devise_parameter_sanitizer
      .permit :account_update, keys: [:username, :email, :password]
  end
end
