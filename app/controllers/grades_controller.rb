class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @grades = Grade.order(:grade)
  end

  def show
    @subjects = @grade.subjects.sort_by{ |subj| - subj.exams.count }
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grade_path(@grade)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @grade.update(grade_params)
    redirect_to grade_path(@grade)
  end

  def destroy
    @grade.destroy
    redirect_to grades_path
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:grade)
  end

  def check_admin
    if user_signed_in?
      redirect_to root_path unless current_user.admin
    else
      redirect_to root_path
    end
  end
end
