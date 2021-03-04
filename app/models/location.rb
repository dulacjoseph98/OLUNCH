class Location < ApplicationRecord
  include PgSearch::Model
  belongs_to :entity
  has_many :events
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :category, presence: true, if: :bar?
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  before_save :category_is_bar?

  pg_search_scope :search_by_category,
    against: [ :category, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def today_public_events
    events.where(public: true)
          .where("start_at > ?", DateTime.now)
  end

  def average_rating
    reviews.average(:rating).to_i
  end

  def category_is_bar?
    self.category = "bar" if self.bar
  end
end
