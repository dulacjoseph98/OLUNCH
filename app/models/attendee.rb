class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  before_create :set_as_pending

  enum status: [ "pending", "accepted", "declined" ]

  def set_as_pending
    self.status = "pending" if self.status.nil?
  end
end
