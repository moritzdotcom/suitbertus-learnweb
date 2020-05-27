class Subject < ApplicationRecord
  belongs_to :grade
  has_many :exams
end
