class CreateAccountEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :account_events do |t|
      t.integer :school_id
      t.integer :account_id
      t.integer :event_id
    end
  end
end
