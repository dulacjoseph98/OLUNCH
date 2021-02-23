class Location < ApplicationRecord
  belongs_to :entity
  has_many :events
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
