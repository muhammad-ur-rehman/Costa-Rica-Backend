class Menu < ApplicationRecord
  validates :category, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
