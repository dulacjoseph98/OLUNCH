class Event < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :users_as_attendees, through: :attendees, source: :user
  validates :start_at, presence: true

  scope :upcoming, -> { where('start_at >= ?', DateTime.now) }

  def accepted_users_as_attendees
    User.joins(attendees: :event).where(attendees: { status: "accepted"}).where(events: { id: self.id })
  end
end
