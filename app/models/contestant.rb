class Contestant < ApplicationRecord
  has_many :votes, dependent: :destroy

  attr_accessor :my_vote
end
