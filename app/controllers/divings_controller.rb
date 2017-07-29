class DivingsController < ApplicationController
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
  
  
  def diving_params
    params.require(:diving).permit(:user_id, :DiveNo, :DiveDate, :DiveIn, :DiveOut, :location, :MaxDepth, :AvgDepth, :WaterTemp, :Transparancy, :Memo)
  end
  
  
end
