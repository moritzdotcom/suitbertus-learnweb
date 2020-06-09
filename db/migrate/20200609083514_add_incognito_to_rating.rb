class AddIncognitoToRating < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :incognito, :boolean
  end
end
