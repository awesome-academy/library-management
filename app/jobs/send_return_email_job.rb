class SendReturnEmailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Borrow.where("status = ? and `to` < ?", 1, Date.today)
      .includes(:books, :user).each do |b|
        UserMailer.with(user: b.user, books: b.books).book_return_late.deliver_now
      end
  end
end
