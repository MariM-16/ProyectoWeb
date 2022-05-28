class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.string :response
      t.datetime :response_date

      t.timestamps
    end
  end
end
