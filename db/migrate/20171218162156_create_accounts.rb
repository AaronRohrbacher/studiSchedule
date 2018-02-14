class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :school_id
      t.integer :user_id
      t.integer :event_id
      t.string :first_name
      t.string :last_name
      t.string :parent_name
      t.string :parent2_name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :phone2
      t.string :email2
      t.string :student_email
      t.string :student_phone
      t.string :type
      t.boolean :admin, default: false
      t.boolean :registration_complete
      t.boolean :active, default: true
    end
  end
end
