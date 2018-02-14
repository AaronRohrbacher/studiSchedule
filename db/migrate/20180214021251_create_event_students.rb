class CreateEventStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :event_students do |t|
      t.integer :event_id
      t.integer :student_id
      t.integer :school_id
    end
  end
end
