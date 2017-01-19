class CreateKeyResults < ActiveRecord::Migration[5.0]
  def change
    create_table :key_results do |t|
      t.string :description
      t.references :objective, foreign_key: true

      t.timestamps
    end
  end
end
