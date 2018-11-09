class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :load_cart
  before_action :load_categories
  before_action :load_publishers

  def search_book
    @q = Book.search params[:q]
    respond_to do |format|
      format.html do
        @books = @q.result.distinct.page(params[:page])
                   .per Settings.constant.page_size
      end
    end
  end

  def load_categories
    @categories = Category.select(:id, :parent, :name)
  end

  def load_publishers
    @publishers = Publisher.order_by_created_at_desc.take Settings.constant.book_new
  end

  def load_cart
    if session[:cart].present?
      @books_in_cart = Book.find session[:cart]["books"]
      return unless @books_in_cart
    else
      session[:cart] = Hash.new
      @books_in_cart = nil
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json {head :forbidden}
      format.html {redirect_to root_url, flash[:error] => exception.message}
    end
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
