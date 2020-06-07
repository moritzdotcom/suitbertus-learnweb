class CommentsController < ApplicationController
  before_action :set_exam
  before_action :set_comment, only: [:update, :destroy]
  before_action :check_valid_user, only: [:update, :destroy]

  def create
    render 'exams/show' unless user_signed_in?
    @comment = Comment.new(comment_params)
    @comment.exam = @exam
    @comment.user = current_user
    if @comment.save
      redirect_to exam_path(@exam, anchor: "comment-#{@comment.id}")
    else
      render 'exams/show'
    end
  end

  private

  def set_exam
    @exam = Exam.find(params[:exam_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_valid_user
    if user_signed_in?
      redirect_to exam_path(@exam) unless current_user.admin || current_user == @comment.user
    else
      redirect_to exam_path(@exam)
    end
  end
end
