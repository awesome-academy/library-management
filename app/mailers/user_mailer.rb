class UserMailer < ApplicationMailer

  def book_return_late
    @user = params[:user]
    @books = params[:books]
    mail to: @user.email, subject: t("mailler.return_late_subject")
  end

  def monthly_sumary
    @user = params[:user]
    @borrow = Borrow.where("created_at < ?", Date.today).group(:status).count
    mail to: @user.email, subject: t("mailler.monthly_report_title")
  end
end
