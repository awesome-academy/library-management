class SumaryMonthlyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Borrow.where(is_admin: 1).each do |admin|
      UserMailer.with(user: admin).monthly_sumary.deliver_now
    end
  end
end
