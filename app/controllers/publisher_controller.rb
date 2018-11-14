class PublisherController < ApplicationController
  before_action :search_book, only: %i(index show)
  before_action :load_cart
  def show
    @authors = Author.select(:id, :name)
    @publishers = Publisher.select(:id, :name)
    @publisher = Publisher.find_by id: params[:id]
    @books = @publisher.books.page(params[:page]).per Settings.constant.page_size
  end
end
