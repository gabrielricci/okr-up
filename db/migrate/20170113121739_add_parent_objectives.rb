class AddParentObjectives < ActiveRecord::Migration[5.0]
  def change
    change_table :objectives do |t|
      t.references :objective, foreign_key: true, null: true
    end
  end
end
