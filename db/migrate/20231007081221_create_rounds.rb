class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.string :title
      t.bigint :owner_id, foreign_key: true
      t.json :data, default: {}
      t.uuid :another_id, null: false, default: "gen_random_uuid()"

      t.timestamps
    end
    # add_index :rounds, :another_id
  end
end
