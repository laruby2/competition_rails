class ChangeLikesCountToVoteCount < ActiveRecord::Migration[7.0]
  def up
    add_column :contestants, :votes_count, :bigint, default: 0
    Contestant.find_each do |cont|
      cont.update(votes_count: cont.likes_count)
    end
    remove_column :contestants, :likes_count, :integer
  end

  def down
    add_column :contestants, :likes_count, :integer, default: 0
    Contestant.find_each do |cont|
      cont.update(likes_count: cont.votes_count)
    end
    remove_column :contestants, :votes_count, :bigint
  end
end
