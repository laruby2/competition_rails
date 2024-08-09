class User < ApplicationRecord
  has_secure_password
  has_many :votes, dependent: :destroy

  has_many :audiences, dependent: :destroy
  has_many :rounds, foreign_key: 'owner_id'

  validates :username, presence: true,
    uniqueness: { case_sensitive: false }

  # validates :phone_number, format: { with: /\A\+[1-9]\d{1,14}\z/ }
  validates :phone_number, format: {
    with: /\A\([0-9]{3}\)[-. ][0-9]{3}[-. ][0-9]{4}\z/
  }

  enum user_role: [:admin, :member]

  def assign_my_votes_to_contestants(contestants)
    my_votes = votes.where(contestant: contestants)
    contestants.collect do |cont|
      cont.my_vote = my_votes.find {|v| v.contestant_id == cont.id }
      cont
    end
  end

  def owner?(round)
    rounds.include?(round)
  end

  def audience?(round)
    round.audiences.exists?(user: self)
  end
end
