class BooksController < ApplicationController
  def index
    @search = Book.search(params[:q])
    @books = @search.result
  end

  def show
    @search = Book.search(params[:q])
    @books = @search.result
  end
end
