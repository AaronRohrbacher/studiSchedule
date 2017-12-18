class CreateTeacherEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_events do |t|
      t.integer :school_id
      t.integer :teacher_id
      t.integer :event_id
    end
  end
end
