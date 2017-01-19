class AddQuarterToObjectives < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :quarter, :integer
    add_index :objectives, :quarter
  end
end
