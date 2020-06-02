class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show]

  def index
    @teachers = Teacher.order(:name)
  end

  def show
    @subjects = @teacher.subjects.map { |subject| subject.name }.uniq
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
