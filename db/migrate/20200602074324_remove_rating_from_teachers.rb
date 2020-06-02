class RemoveRatingFromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :rating, :integer
  end
end
