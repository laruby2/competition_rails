class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.string :title
      t.bigint :owner_id, foreign_key: true
      t.json :data, default: {}

      t.timestamps
    end
  end
end
