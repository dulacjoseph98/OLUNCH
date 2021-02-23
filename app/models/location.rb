class Location < ApplicationRecord
  belongs_to :entity
  has_many :events
  has_many :reviews
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :category, presence: true
end
