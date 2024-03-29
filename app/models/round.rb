class Round < ApplicationRecord
  has_many :audiences, dependent: :destroy
  has_many :users, through: :audiences
  has_many :contestants
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :title, presence: true

  def to_param
    another_id
  end
end
