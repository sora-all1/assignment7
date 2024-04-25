class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :num_of_guests, presence: true

  validates :num_of_guests, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validate :check_out_must_be_on_or_after_check_in

  private

  def check_out_must_be_on_or_after_check_in
    return if check_out.blank? || check_in.blank?

    errors.add(:check_out, :invalid) if check_out <= check_in
  end
end
