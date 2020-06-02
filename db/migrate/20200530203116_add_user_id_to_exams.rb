class AddUserIdToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :user, foreign_key: true
  end
end
