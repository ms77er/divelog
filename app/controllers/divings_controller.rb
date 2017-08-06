class DivingsController < ApplicationController
   before_action :require_user_logged_in
   before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
    @diving = @user.divings.build  # form_for 用
  end

  def create  
    @diving = Diving.new(diving_params)

    if @diving.save
      flash[:success] = '正常に登録されました'
      redirect_to @diving
    else
      flash.now[:danger] = '登録されませんでした'
      render :new
    end
  end  
  
  def show
    @user = current_user
    @diving = @user.divings.build  # form_for 用
    @divings = @user.divings.find_by(id: params[:id])
  end
  
  def update
    @user = current_user
    @diving = @user.divings.build  # form_for 用
    @divingup = @user.divings.find_by(id: params[:id])
    
    if @divingup.update(diving_params)
      flash[:success] = 'Updated successfully / 正常に更新されました'
      redirect_to @divingup
    else
      flash.now[:danger] = 'Update error / 更新されませんでした'
      render :edit
    end
  end

  def edit
    @user = current_user
    @divingup =  @user.divings.find_by(id: params[:id])
  end  
 
  def destroy
    @user = current_user
    @divings =  @user.divings.find_by(id: params[:id])
    @divings.destroy

    flash[:success] = 'Deleted successfully / 正常に削除されました'
    redirect_to @user
  end
  
  private

  def diving_params
    params.require(:diving).permit(:user_id, :DiveNo, :DiveDate, :DiveIn, :DiveOut, :location, :MaxDepth, :AvgDepth, :WaterTemp, :Transparancy, :Memo)
  end

  def correct_user
    @divings = Diving.find(params[:id])
    unless @divings.user_id == current_user.id
      redirect_to root_url
    end
  end 

end
