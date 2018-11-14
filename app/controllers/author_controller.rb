class AuthorController < ApplicationController
  before_action :search_book, only: %i(index show)
  before_action :load_cart
  def show
    @authors = Author.select(:id, :name)
    @publishers = Publisher.select(:id, :name)
    @author = Author.find_by id: params[:id]
    @books = @author.books.page(params[:page]).per Settings.constant.page_size
  end
end

