module Admin::BorrowsHelper
  def select_borrows_status
    Borrow.statuses.collect {|b| [b.first, b.last]}
  end
end
