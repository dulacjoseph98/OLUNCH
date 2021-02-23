class Entity < ApplicationRecord
  has_many :user_entities
  has_many :locations
  validates :name, presence: true, uniqueness: true
end
