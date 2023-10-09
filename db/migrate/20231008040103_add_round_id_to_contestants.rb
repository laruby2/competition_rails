class AddRoundIdToContestants < ActiveRecord::Migration[7.0]
  def change
    add_column :contestants, :round_id, :bigint, foreign_key: true
    add_index :contestants, :round_id
  end
end
