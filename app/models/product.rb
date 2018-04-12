class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 2..100 }
  validates :description, presence: true
  validates :price, presence: true

end
