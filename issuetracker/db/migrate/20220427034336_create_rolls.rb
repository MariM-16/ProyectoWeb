class CreateRolls < ActiveRecord::Migration[7.0]
  def change
    create_table :rolls do |t|
      t.string :roll

      t.timestamps
    end
  end
end
