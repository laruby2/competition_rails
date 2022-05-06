class AddAnotherIdToUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    add_column :users, :another_id, :uuid, null: false, default: "gen_random_uuid()"
    add_index :users, :another_id, if_not_exists: true
  end
end
