class SearchController < ApplicationController
  def results
    @search_term = search_params

    @subjects = []
    @exams = []
    @teachers = []

    @subjects << Subject.where("name LIKE ?", "%" + @search_term + "%").or(Subject.where("name LIKE ?", "%" + @search_term.capitalize + "%"))
    @teachers << Teacher.where("name LIKE ?", "%" + @search_term + "%").or(Teacher.where("name LIKE ?", "%" + @search_term.capitalize + "%"))
    @teachers << @subjects.flatten.map { |subject| subject.teachers }

    @exams << Exam.where("title LIKE ?", "%" + @search_term.capitalize + "%").or(Exam.where(year: @search_term.to_i)).or(Exam.where("title LIKE ?", "%" + @search_term + "%"))
    Exam.all.each do |exam|
      @exams << exam if exam.teacher.name.downcase.include? @search_term.downcase
      @exams << exam if exam.subject.name.downcase.include? @search_term.downcase
    end

    @subjects.flatten!.uniq!
    @exams.flatten!.uniq!
    @teachers.flatten!.uniq!

    @result_count = @subjects.count + @exams.count + @teachers.count
  end

  private

  def search_params
    params.require(:search)
  end
end
