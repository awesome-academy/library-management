class BooksController < ApplicationController
  before_action :search_book, only: %i(index show)

  def index
    @authors = Author.select(:id, :name)
  end

  def show
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "client.book_not_found"
    redirect_to :root
  end
end
