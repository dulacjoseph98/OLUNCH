class UserEntity < ApplicationRecord
  belongs_to :user
  belongs_to :entity
  validates :role, presence: true
  validates :status, presence: true
end
