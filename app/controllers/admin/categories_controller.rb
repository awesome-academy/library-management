class Admin::CategoriesController < Admin::AdminBaseController
  before_action :get_category, only: %i(edit update destroy)

  def index
    @categories = Category.parent_only
      .includes(:subcategories).show_only
      .page(params[:page]).per Settings.constant.page_size
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path
      flash[:success] = t "admin.create_success"
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end

  def update
    if @category.update category_params
      redirect_to admin_categories_path
      flash[:success] = t "admin.update_success"
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.books.update category_id: nil
    if @category.delete
      flash[:success] = t "admin.delete_success"
    else
      flash[:error] = @category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

  private

  def get_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:error] = t "admin.category_not_found"
  end

  def category_params
    params.require(:category).permit :name, :parent
  end
end
