class Entity < ApplicationRecord
  has_many :user_entities
  has_many :locations
  validates :name, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
