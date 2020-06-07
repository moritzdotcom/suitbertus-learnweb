class Exam < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  belongs_to :user
  has_one :grade, through: :subject
  has_many :comments

  has_one_attached :pdf_file

  validates_presence_of :title, message: 'Bitte trage hier den Titel der Klausur ein'
  validates_presence_of :year, message: 'Bitte trage hier das Jahr der Klausur ein'
  validates_presence_of :subject, message: 'Bitte wähle hier das Fach der Klausur aus'
  validates_presence_of :grade, message: 'Bitte wähle hier die Stufe aus, in der die Klausur geschreiben wurde'
  validates_presence_of :teacher_name, message: 'Bitte trage hier den Namen des Lehrers ein'

  validate :file_is_attached

  def file_is_attached
    errors.add(:pdf_file, "Bitte lade hier eine PDF Datei der Klausur hoch") unless pdf_file.attached?
  end

  def teacher_name
    teacher.try(:name)
  end

  def teacher_name=(name)
    self.teacher = Teacher.find_by_name(name) if name.present?
  end
end
