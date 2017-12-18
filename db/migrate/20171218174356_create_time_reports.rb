class CreateTimeReports < ActiveRecord::Migration[5.1]
  def change
    create_table :time_reports do |t|
      t.integer :school_id
      t.integer :teacher_id
      t.string :event_name
      t.decimal :time
      t.decimal :rate
      t.boolean :paid
    end
  end
end
