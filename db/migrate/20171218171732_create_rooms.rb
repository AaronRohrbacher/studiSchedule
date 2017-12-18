class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :school_id
      t.string :name
      t.string :room_number
    end
  end
end
