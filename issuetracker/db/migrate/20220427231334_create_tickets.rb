class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :category
      t.datetime :creation_date
      t.datetime :resolution_date
      t.datetime :limit_date
      t.string :priority
      t.string :state
      t.string :tags
      t.boolean :docs
      t.string :key_resolution

      t.references :user, foreign_key: true
      t.references :executive, foreign_key: {to_table: "users"}
      t.timestamps
    end
  end
end
