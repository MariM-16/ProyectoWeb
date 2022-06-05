class AddUserRefToResponse < ActiveRecord::Migration[7.0]
  def change
    add_reference :responses, :user, null: false, foreign_key: true
  end
end
