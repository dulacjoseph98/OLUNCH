class Location < ApplicationRecord
  belongs_to :entity
  has_many :events
  has_many :reviews
end
