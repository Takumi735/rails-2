class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_out_after_check_in
  validates :number_of_guests, presence: true, numericality: { greater_than: 0 }

  def total_days
    return 0 unless check_in && check_out

    (check_out.to_date - check_in.to_date).to_i + 1
  end

  def total_price
    room.price * number_of_guests * total_days
  end

  private

  def check_out_after_check_in
    return if check_out.blank? || check_in.blank?

    if check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後に設定してください")
    end
  end
end
