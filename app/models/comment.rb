class Comment < ApplicationRecord
  belongs_to :exam
  belongs_to :user

  validates :content, length: { minimum: 2 }

  def date
    "#{self.created_at.day}.#{self.created_at.month}.#{self.created_at.year}"
  end
end
