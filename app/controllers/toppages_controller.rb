class ToppagesController < ApplicationController

  def index
    if logged_in?
      @user = current_user
      @diving = current_user.divings.build  # form_for 用
      @divings = current_user.divings.order('created_at DESC').page(params[:page])
    end
  end
  
end
