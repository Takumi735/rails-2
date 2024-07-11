class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :price, numericality: { greater_than_or_equal_to: 1,message: "は1円以上でなければなりません。" }

  has_many :reservations
  belongs_to :user
end
