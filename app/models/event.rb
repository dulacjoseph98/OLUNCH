class Event < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :users_as_attendees, through: :attendees, source: :user
  validates :start_at, presence: true

end
