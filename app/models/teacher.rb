class Teacher < ApplicationRecord
  has_many :exams
  has_many :subjects, through: :exams
  has_many :ratings

  validates_presence_of :name

  def rating
    rating_array = ratings.map { |rating| rating.rating }
    rating_array.length > 0 ? (rating_array.sum * 100 / rating_array.count).to_f / 100 : 0
  end
end
