class Admin::BooksController < Admin::AdminBaseController
  load_and_authorize_resource param_method: :book_param
  before_action :get_book, only: %i(edit update destroy)

  def index
    @q = Book.ransack params[:q]
    respond_to do |format|
      format.html do
        @books = @q.result.distinct.page(params[:page])
          .per Settings.constant.page_size
      end
      format.csv do
        @books = @q.result.distinct
        disposition = "filename=Book-#{Time.now.strftime("%m-%d-%Y")}.csv"
        send_data Book.to_csv(@books),
          type: "text/csv; charset=iso-8859-1; header=present",
          disposition: disposition
      end
    end
  end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = Book.new books_param
    if @book.save
      redirect_to admin_books_path
      flash[:success] = t "admin.create_success"
    else
      flash[:error] = @book.errors.full_messages
      render :new
    end
  end

  def update
    if @book.update books_param
      redirect_to admin_books_path
      flash[:success] = t "admin.update_success"
    else
      flash[:error] = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    @book.borrow_books.update book_id: nil
    if @book.delete
      flash[:success] = t "admin.delete_success"
    else
      flash[:error] = @category.errors.full_messages
    end
    redirect_to admin_books_path
  end

  private

  def get_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:error] = t "book.book_not_found"
  end

  def books_param
    params.require(:book).permit :name, :describe, :image, :page_number,
      :author_id, :category_id, :publisher_id
  end
end
