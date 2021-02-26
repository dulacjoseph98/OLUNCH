class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: [ "pending", "accepted", "declined" ]
end
