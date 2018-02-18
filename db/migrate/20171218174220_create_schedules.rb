class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :school_id
      t.integer :event_id
      t.integer :room_id
      t.string :day
      t.string :recurring
      t.time :start_time
      t.time :end_time
      t.date :date
    end
  end
end
