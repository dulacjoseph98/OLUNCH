class Entity < ApplicationRecord
  has_many :user_entities
  has_many :locations
end
