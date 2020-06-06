class Grade < ApplicationRecord
  has_many :subjects
  has_many :exams, through: :subjects
end
