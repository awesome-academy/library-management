class StaticPagesController < ApplicationController
  before_action :search_book, only: %i(home)
  def home
    @books = Book.order_by_created_at_desc.take Settings.constant.book_new
  end
end
