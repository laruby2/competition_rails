class Round < ApplicationRecord
  has_many :audiences, dependent: :destroy
  has_many :users, through: :audiences
  has_many :contestants
  has_one :owner, class_name: 'User', foreign_key: 'owner_id'
end
