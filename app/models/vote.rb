class Vote < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :contestant, counter_cache: true

  after_create_commit -> {
    broadcast_update_later_to "activity",
      target: "#{dom_id(self.contestant)}_votes_count",
      html: self.contestant.votes_count,
      locals: { vote: self }
  }

  after_destroy_commit -> {
    broadcast_update_later_to "activity",
      target: "#{dom_id(self.contestant)}_votes_count",
      html: self.contestant.votes_count,
      locals: { vote: nil }
  }
end
