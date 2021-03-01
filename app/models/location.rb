class Location < ApplicationRecord
  belongs_to :entity
  has_many :events
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :category, presence: true
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  before_save :category_is_bar?

  def today_public_events
    events.where(public: true)
          .where("start_at > ?", Date.today.beginning_of_day)
          .where("start_at < ?", Date.today.end_of_day)
  end

  def average_rating
    reviews.average(:rating).to_i
  end

  def category_is_bar?
    self.category = "bar" if self.bar
  end
end
