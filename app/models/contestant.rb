class Contestant < ApplicationRecord
  has_many :votes

  attr_accessor :my_vote
end
