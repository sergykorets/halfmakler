class Room < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reviews

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true

  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  def add_coordinates
    puts geocode.inspect
    coodinates = geocode
    puts geocode.inspect
    update(latitude: coodinates[0], longitude: coodinates[1]) unless self.new_record?
  end

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2).to_i
  end
end
