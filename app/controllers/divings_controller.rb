class DivingsController < ApplicationController
  def new
    @user = User.new
    @diving = @user.divings.build  # form_for 用
  end

  def create  
    @diving = Diving.new(diving_params)

    if @diving.save
      flash[:success] = '正常に登録されました'
      render :new    
    else
      flash.now[:danger] = '登録されませんでした'
      render :new
    end
  end  
  
  def diving_params
    params.require(:diving).permit(:user_id, :DiveNo, :DiveDate, :DiveIn, :DiveOut, :location, :MaxDepth, :AvgDepth, :WaterTemp, :Transparancy, :Memo)
  end
  
  
end
