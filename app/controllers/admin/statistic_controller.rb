class Admin::StatisticController < ApplicationController
  before_action :authen
  layout "admin"

  def index; end

  def authen
    raise CanCan::AccessDenied unless current_user&.is_admin?
  end
end
