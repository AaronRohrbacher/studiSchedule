class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :school_id
      t.integer :account_id
      t.string :event_name
      t.string :attendance_type
    end
  end
end
