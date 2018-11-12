class Admin::AuthorController < Admin::AdminBaseController
  before_action :load_author, only: %i(update destroy)

  def index
    @authors = Author.select(:id, :name, :describe)
      .page(params[:page]).per Settings.constant.page_size
  end

  def create
    @author = Author.new author_param
    if @author.save
      flash[:success] = t "admin.create_success"
    else
      flash[:error] = @author.errors.full_messages
    end
    redirect_to admin_author_index_path
  end

  def update
    if @author.update author_param
      flash[:success] = t "admin.update_success"
    else
      flash[:error] = @author.errors.full_messages
    end
    redirect_to admin_author_index_path
  end

  def destroy
    @author.books.update author_id: nil
    if @author.delete
      flash[:success] = t "admin.delete_success"
    else
      flash[:error] = @author.errors.full_messages
    end
    redirect_to admin_author_index_path
  end

  private

  def author_param
    params.permit :name, :describe
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:error] = t "admin.author_not_found"
    redirect_to admin_author_index_path
  end
end
