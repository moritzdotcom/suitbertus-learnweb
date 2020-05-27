class AddTitleToExams < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :title, :string
    add_column :exams, :year, :integer
  end
end
