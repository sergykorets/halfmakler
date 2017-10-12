class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_uniqueness_of :room_id, scope: :user_id
end
