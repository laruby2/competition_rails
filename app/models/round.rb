class Round < ApplicationRecord
  has_many :audiences
  has_many :users, through: :audiences
  has_many :contestants
  has_one :owner, class_name: 'User'
end
