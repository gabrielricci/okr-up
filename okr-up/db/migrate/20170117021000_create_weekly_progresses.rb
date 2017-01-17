class CreateWeeklyProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :weekly_progresses do |t|
      t.references :key_result
      t.integer :year
      t.integer :week
      t.integer :progress

      t.timestamps
    end
  end
end
