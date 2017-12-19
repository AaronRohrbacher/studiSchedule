class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :school_id
      t.string :name
      t.string :event_type
      t.string :description
    end
  end
end
