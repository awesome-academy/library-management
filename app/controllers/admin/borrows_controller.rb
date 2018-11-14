class Admin::BorrowsController < Admin::AdminBaseController
  load_and_authorize_resource

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
    borrow_status = params[:borrow][:status].to_i
    if borrow_status.equal? Borrow.statuses["accept"]
      unless can_accept?
        flash[:error] = t "borrow.cannot_accept"
        redirect_to admin_borrows_path
        return
      end
    end
    if @borrow.update status: borrow_status
      redirect_to admin_borrows_path
    else
      flash[:error] = @borrow.errors.full_messages
    end
  end

  def can_accept?
    borrow_ids = @borrow.books.select :id
    t = Borrow.arel_table
    same_time = t[:from].between(@borrow.from..@borrow.to)
      .or(t[:to].between(@borrow.from..@borrow.to))
    Borrow.joins(:books).where("books.id in (?)", borrow_ids)
      .where(status: 1).where(same_time).first.nil?
  end
end
