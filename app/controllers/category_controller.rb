class CategoryController < ApplicationController
  before_action :search_book, only: %i(index show)
  before_action :load_cart
  def show
    @authors = Author.select(:id, :name)
    @publishers = Publisher.select(:id, :name)
    t = Category.arel_table
    row = t[:id].eq(params[:id]).or(t[:parent].eq(params[:id]))
    category_ids = Category.where(row).select(:id)
    @books = Book.where(category_id: category_ids)
      .page(params[:page]).per Settings.constant.page_size
  end
end
