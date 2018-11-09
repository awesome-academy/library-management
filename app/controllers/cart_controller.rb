class CartController < ApplicationController

  def add
    session[:cart] ||= {}
    books = session[:cart]["books"]
    if (books && books != {})
      if books.include? params[:id]
        flash[:danger] = t "borrow.book_exit"
        redirect_to request.referrer
        return
      end
      session[:cart]["books"] << params[:id]
    else
      session[:cart]["books"] = Array(params[:id])
    end
    flash[:success] = t "borrow.add_success"
    respond_to do |format|
      format.html {redirect_to request.referrer || :root}
    end
  end

  def delete
    session[:cart] ||= {}
    books = session[:cart]["books"]
    id = params[:id]
    unless id.blank?
      books.delete(params["id"])
    else
      books.delete
    end
    flash[:success] = t "borrow.del_success"
    respond_to do |format|
      format.html {redirect_to request.referrer || :root}
    end
  end
end
