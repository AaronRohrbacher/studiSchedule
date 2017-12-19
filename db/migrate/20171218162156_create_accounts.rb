class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.integer :school_id
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :parent_name
      t.string :parent2_name
      t.string :address_one
      t.string :address2_one
      t.string :city_one
      t.string :state_one
      t.string :zip_one
      t.string :address_two
      t.string :address2_two
      t.string :city_two
      t.string :state_two
      t.string :zip_two
      t.string :phone_one
      t.string :phone_two
      t.string :email_one
      t.string :email_two
      t.string :student_email
      t.boolean :admin, default: false
      t.boolean :teacher, default: false
      t.boolean :active, default: true

    end
  end
end
