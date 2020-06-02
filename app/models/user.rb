class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :exams
  has_many :ratings

  validates_presence_of :first_name, message: 'Dein Vorname'
  validates_presence_of :last_name, message: 'Dein Nachname'
  validates_presence_of :email, message: 'Bitte trage deine Email ein'

  def full_name
    "#{first_name} #{last_name}"
  end

  def has_rated(teacher)
    ratings.where(teacher: teacher).exists?
  end
end
