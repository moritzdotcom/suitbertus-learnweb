class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_action :set_teachers, only: [:new, :create, :edit, :update]
  before_action :check_valid_user, only: [:edit, :update, :destroy]

  def index
    @exams = Exam.order(year: :desc)
    @subjects = Subject.distinct.pluck(:name).sort()
    @years = Exam.distinct.pluck(:year).sort().reverse()
    @teachers = Teacher.distinct.pluck(:name).sort()
    @grades = Grade.all.order(:grade)
  end

  def show
  end

  def new
    @exam = Exam.new
  end

  def create
    render :new unless user_signed_in?
    grade = Grade.find_by_grade(exam_params[:grade].split(' ')[1].to_i)
    subject = exam_params[:subject] == '' ? nil : Subject.where(grade: grade).find_by_name(exam_params[:subject]) || Subject.create(name: exam_params[:subject], grade: grade)
    teacher = Teacher.find_by_name(exam_params[:teacher_name].split(' ').map {|word| word.capitalize }.join(' ')) || Teacher.create(name: exam_params[:teacher_name].split(' ').map {|word| word.capitalize }.join(' '))
    @exam = Exam.new(title: exam_params[:title], year: exam_params[:year], subject: subject, teacher: teacher, pdf_file: exam_params[:pdf_file], user: current_user)
    if @exam.save
      redirect_to exam_path(@exam)
    else
      render :new
    end
  end

  def edit
  end

  def update
    render :edit unless user_signed_in? && current_user == @exam.user
    grade = Grade.find_by_grade(exam_params[:grade].split(' ')[1].to_i) || @exam.subject.grade
    subject = exam_params[:subject] == '' ? @exam.subject : Subject.where(grade: grade).find_by_name(exam_params[:subject]) || Subject.create(name: exam_params[:subject], grade: grade)
    teacher = exam_params[:teacher_name] == '' ? @exam.teacher : Teacher.find_by_name(exam_params[:teacher_name].split(' ').map {|word| word.capitalize }.join(' ')) || Teacher.create(name: exam_params[:teacher_name].split(' ').map {|word| word.capitalize }.join(' '))
    if @exam.update(title: exam_params[:title], year: exam_params[:year], subject: subject, teacher: teacher)
      redirect_to exam_path(@exam)
    else
      render :edit
    end
  end

  def destroy
    @subject = @exam.subject
    @exam.pdf_file.purge
    @exam.destroy
    redirect_to subject_path(@subject)
  end

  private

  def set_exam
    @exam = Exam.find(params[:id])
  end

  def set_teachers
    @teachers = Teacher.distinct.pluck(:name).sort()
  end

  def exam_params
    params.require(:exam).permit(:title, :year, :subject, :grade, :teacher_name, :pdf_file)
  end

  def check_valid_user
    if user_signed_in?
      redirect_to root_path unless current_user.admin || current_user == @exam.user
    else
      redirect_to root_path
    end
  end
end
