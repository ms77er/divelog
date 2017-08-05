class UsersController < ApplicationController
   before_action :require_user_logged_in

  def show
    @user = User.find(params[:id])
    @diving = @user.divings.build  # form_for 用
    @divings = @user.divings.order('created_at DESC').page(params[:page]).per(20)
    @count_divings = @user.divings.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :LicenceNo, :password, :password_confirmation)
  end
end
