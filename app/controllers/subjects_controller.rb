class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @subjects = Subject.order(:name)
  end

  def show
    @exams = @subject.exams
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @subject.update(subject_params)
    redirect_to subject_path(@subject)
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path
  end

  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :grade_id)
  end

  def check_admin
    if user_signed_in?
      redirect_to root_path unless current_user.admin
    else
      redirect_to root_path
    end
  end
end
