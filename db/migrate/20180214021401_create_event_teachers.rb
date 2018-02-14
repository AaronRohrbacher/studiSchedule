class CreateEventTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_teachers do |t|
      t.integer :event_id
      t.integer :teacher_id
      t.integer :school_id
    end
  end
end
