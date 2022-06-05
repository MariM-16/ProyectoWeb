class AddRollRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :roll, null: false, foreign_key: true
  end
end
