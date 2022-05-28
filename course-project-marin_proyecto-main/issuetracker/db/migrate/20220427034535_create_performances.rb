class CreatePerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :performances do |t|
      t.integer :evaluation

      t.references :user, foreign_key: true
      t.references :executive, foreign_key: {to_table: "users"}
      t.timestamps
    end
  end
end
