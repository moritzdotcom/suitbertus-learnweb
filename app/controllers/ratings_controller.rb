class RatingsController < ApplicationController
  before_action :set_teacher, only: [:new, :create, :edit, :update]
  before_action :set_rating, only: [:edit, :update, :destroy]
  before_action :check_valid_user, only: [:edit, :update, :destroy]

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.teacher = @teacher
    if @rating.save
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rating.update(rating_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @rating.destroy
    redirect_to dashboard_path
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end

  def check_valid_user
    if user_signed_in?
      redirect_to root_path unless current_user.admin || current_user == @rating.user
    else
      redirect_to root_path
    end
  end
end
