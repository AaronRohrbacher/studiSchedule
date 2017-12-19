class CreateTeacherAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_accounts do |t|
      t.integer :account_id
      t.integer :teacher_id
    end
  end
end
