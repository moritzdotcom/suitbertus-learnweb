class SearchController < ApplicationController
  def results
    @search_term = search_params

    @subjects = []
    @exams = []
    @teachers = []

    @subjects << Subject.where("name LIKE ?", "%" + @search_term.capitalize + "%")
    @teachers << Teacher.where(name: @search_term)

    @exams << Exam.where("title LIKE ?", "%" + @search_term.capitalize + "%").or(Exam.where(year: @search_term.to_i))
    Exam.all.each do |exam|
      @exams << exam if exam.teacher.name.downcase.include? @search_term.downcase
      @exams << exam if exam.subject.name.downcase.include? @search_term.downcase
    end

    @subjects.flatten!
    @exams.flatten!
    @teachers.flatten!

    @result_count = @subjects.count + @exams.count + @teachers.count
  end

  private

  def search_params
    params.require(:search)
  end
end
