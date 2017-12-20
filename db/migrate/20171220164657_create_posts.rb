class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :board_id
      t.string :account_id
      t.string :post
    end
  end
end
