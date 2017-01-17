class AddYearToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :year, :integer
    add_index :objectives, :year
  end
end
