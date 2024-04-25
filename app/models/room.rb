class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user

  #scope :search_by_name, -> (query) { where('name ILIKE ?', "%#{query}%") }
  #scope :search_by_introduction, -> (query) { where('introduction ILIKE ?', "%#{query}%") }
  #scope :search_by_address, -> (query) { where('address ILIKE ?', "%#{query}%") }

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :name, presence: true
  validates :detail, presence: true
  validates :address, presence: true
end
