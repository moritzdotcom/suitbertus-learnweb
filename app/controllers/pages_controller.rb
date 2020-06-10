class PagesController < ApplicationController
  def home
  end

  def dashboard
    if user_signed_in?
      @user = current_user
      @exams = @user.exams
      @ratings = @user.ratings
    else
      redirect_to root_path
    end
  end

  def manual
  end
end
