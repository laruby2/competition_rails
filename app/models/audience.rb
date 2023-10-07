class Audience < ApplicationRecord
  belongs_to :user
  belongs_to :round

  validates :name, presence: true
  validates :user_id, uniqueness: { scope: :round_id }
end
