class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :school_id
      t.integer :event_id
      t.integer :room_id
      t.string :day
      t.decimal :duration
      t.time :start_time
      t.time :end_time
    end
  end
end
