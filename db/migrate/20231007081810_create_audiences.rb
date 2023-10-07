class CreateAudiences < ActiveRecord::Migration[7.0]
  def change
    create_table :audiences do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :round_id, foreign_key: true
      t.uuid :another_id, null: false, default: "gen_random_uuid()"

      t.timestamps
    end
    add_index :audiences, :another_id
  end
end
