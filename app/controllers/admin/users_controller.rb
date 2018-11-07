class Admin::UsersController < Admin::AdminBaseController
  before_action :get_user, only: %i(edit update destroy update_role)

  def index
    @q = User.ransack params[:q]
    respond_to do |format|
      format.html
      format.js
      format.csv do
        @users = @q.result.distinct
        disposition = "filename=User-#{Time.now.strftime("%m-%d-%Y")}.csv"
        send_data  User.to_csv(@users),
          type: "text/csv; charset=iso-8859-1; header=present",
          disposition: disposition
      end
    end
    @users = @q.result.distinct.page(params[:page])
      .per Settings.constant.page_size
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "admin.update_success"
      redirect_to admin_users_path
    else
      flash[:error] = t "admin.can_not_update"
      render :edit
    end
  end

  def destroy
    if @user.delete
      flash[:success] = t "admin.delete_success"
    else
      flash[:error] = t "admin.can_not_delete"
    end
    @q = User.ransack params[:q]
    @users = @q.result.distinct.page(params[:page])
      .per Settings.constant.page_size
    respond_to do |format|
      format.js {render :index}
    end
  end

  def update_role
    @user.is_admin = !@user.is_admin
    @user.save
    @q = User.ransack params[:q]
    @users = @q.result.distinct.page(params[:page])
      .per Settings.constant.page_size
    respond_to do |format|
      format.js {render :index}
    end
  end

  private

  def get_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t "admin.user_not_found"
    redirect_to admin_users_path
  end

  def user_params
    param = params.require(:user)
      .permit :email, :username, :password, :password_confirmation
    param.except :password, :password_confirmation if param[:password].blank?
  end
end
