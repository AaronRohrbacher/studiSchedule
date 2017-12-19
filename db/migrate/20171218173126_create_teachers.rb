class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.integer :school_id
      t.string :first_name
      t.string :last_name
    end
  end
end
