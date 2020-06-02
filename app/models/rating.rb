class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates_presence_of :rating

  before_save :set_rating

  def set_rating
    self.rating = self.rating >= 5 ? 5 : self.rating
    self.rating = self.rating <= 0 ? 0 : self.rating
  end
end
