class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :school_id
      t.integer :event_id
      t.integer :room_id
      t.integer :day
      t.integer :start_time
      t.integer :end_time
    end
  end
end
