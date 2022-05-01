class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :contestant_id, null: false
      t.bigint :user_id, null: false

      t.timestamps
    end
    add_index :votes, :contestant_id
    add_index :votes, :user_id
  end
end
