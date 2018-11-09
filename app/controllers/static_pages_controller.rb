class StaticPagesController < ApplicationController
  def home
      @search = User.search(params[:q])
      @users = @search.result
    end
end
