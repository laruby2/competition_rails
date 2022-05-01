class CreateContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :contestants do |t|
      t.string :name
      t.string :location
      t.integer :likes_count, default: 0

      t.timestamps
    end
  end
end
