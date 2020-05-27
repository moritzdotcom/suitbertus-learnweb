class Teacher < ApplicationRecord
  has_many :exams
  has_many :subjects, through: :exams
end
