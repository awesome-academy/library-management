class Admin::BorrowsController < Admin::AdminBaseController
  def index
    @q = Borrow.ransack params[:q]
    respond_to do |format|
      format.html do
        @borrows = @q.result.distinct
          .includes(:books, :user)
          .page(params[:page]).per Settings.constant.page_size
      end
      format.csv do
        @borrows = @q.result.distinct
        disposition = "filename=Borrow-#{Time.now.strftime("%m-%d-%Y")}.csv"
        send_data Borrow.to_csv(@borrows),
          type: "text/csv; charset=iso-8859-1; header=present",
          disposition: disposition
      end
    end
  end

  def update
    @borrow = Borrow.find_by id: params[:id]
    return if @borrow.nil?
    if @borrow.update status: params[:borrow][:status].to_i
      redirect_to admin_borrows_path
    else
      flash[:error] = @borrow.errors.full_messages
    end
  end
end
