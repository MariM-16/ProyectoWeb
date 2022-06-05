class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :report
      t.datetime :init_date
      t.datetime :finish_date
      t.datetime :act_date

      t.timestamps
    end
  end
end
