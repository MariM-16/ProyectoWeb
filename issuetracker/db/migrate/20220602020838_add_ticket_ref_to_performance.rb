class AddTicketRefToPerformance < ActiveRecord::Migration[7.0]
  def change
    add_reference :performances, :ticket, null: false, foreign_key: true
  end
end
