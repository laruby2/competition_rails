class CreateAudiences < ActiveRecord::Migration[7.0]
  def change
    create_table :audiences do |t|
      t.bigint :user_id, foreign_key: true
      t.bigint :round_id, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
