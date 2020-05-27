class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :teacher, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
