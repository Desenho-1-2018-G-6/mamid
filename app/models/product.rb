class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 2..150 }
  validates :description, presence: true
  validates :price, presence: true, :numericality => {:greater_than_or_equal_to => 0}
  validates :stock, presence: true, :numericality => {:greater_than_or_equal_to => 0}

end
