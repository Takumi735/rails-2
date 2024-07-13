class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :rooms
end
