class Admin::PublisherController < Admin::AdminBaseController
  before_action :load_publisher, only: %i(update destroy)

  def index
    @publishers = Publisher.select(:id, :name)
      .page(params[:page]).per Settings.constant.page_size
  end

  def create
    @publisher = Publisher.new name: params[:name]
    if @publisher.save
      flash[:success] = t "admin.create_success"
    else
      flash[:error] = t "admin.can_not_create"
    end
    redirect_to admin_publisher_index_path
  end

  def update
    if @publisher.update name: params[:name]
      flash[:success] = t "admin.update_success"
    else
      flash[:error] = t "admin.can_not_update"
    end
    redirect_to admin_publisher_index_path
  end

  def destroy
    @publisher.books.update publisher_id: nil
    if @publisher.delete
      flash[:success] = t "admin.delete_success"
    else
      flash[:error] = t "admin.can_not_delete"
    end
    redirect_to admin_publisher_index_path
  end

  private

  def load_publisher
    @publisher = Publisher.find_by id: params[:id]
    return if @publisher
    flash[:error] = t "admin.publisher_not_found"
    redirect_to admin_publisher_index_path
  end
end
