class BorrowController < ApplicationController
  before_action :search_book, only: %i(index)
  before_action :load_user
  before_action :load_cart

  def index
    @borrows = Borrow.select(:id, :user_id, :status, :created_at, :from, :to).get_by_current_user
  end

  def create
    ActiveRecord::Base.transaction do
      borrow = current_user.borrows.build borrow_params
      book_ids = session[:cart]["books"]
      book_ids.each do |id|
        book = Book.find_by id: id
        borrow.books << book
      end
      if borrow.save
        session[:cart]["books"] = Array.new
        flash[:success] = t "admin.create_success"
      else
        flash[:danger] = t "admin.can_not_create"
      end
      redirect_to request.referrer || :root
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = t "admin.can_not_create"
    redirect_to request.referrer || :root
  end

  private

  def borrow_params
    params.permit :from, :to, :status
  end

  def load_user
    return if user_signed_in?
    flash[:danger] = t "client.must_login"
    redirect_to new_user_session_path
  end
end
