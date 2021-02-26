class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_entities
  has_many :entities, through: :user_entities
  has_many :attendees
  has_many :events
  has_many :events_as_attendee, through: :attendees, source: :event
  has_many :reviews

  def pending_events_as_attendee
    events_as_attendee.joins(:attendees).where(attendees: { status: "pending" })
  end

  def not_pending_events_as_attendee
    events_as_attendee - pending_events_as_attendee
  end
end
