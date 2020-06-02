class Subject < ApplicationRecord
  belongs_to :grade
  has_many :exams
  has_many :teachers, through: :exams

  before_save :select_icon

  def select_icon
    icons = {
      Biologie: 'fas fa-leaf',
      Chemie: 'fas fa-flask',
      Deutsch: 'fas fa-book',
      Englisch: 'fas fa-flag-usa',
      Erdkunde: 'fas fa-atlas',
      Französisch: 'fas fa-globe-europe',
      Geschichte: 'fab fa-fort-awesome',
      Informatik: 'fas fa-laptop-code',
      Italienisch: 'fas fa-globe-europe',
      Kunst: 'fas fa-palette',
      Latein: 'fas fa-landmark',
      Literatur: 'fas fa-book-open',
      Mathematik: 'fas fa-calculator',
      Musik: 'fas fa-music',
      Philosophie: 'fas fa-question-circle',
      Physik: 'fas fa-atom',
      Religion: 'fas fa-bible',
      SoWi: 'fas fa-chart-area',
      Spanisch: 'fas fa-globe-europe',
      Sport: 'fas fa-futbol',
    }

    self.icon = icons[self.name.to_sym]
  end
end
