class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 2..150 }
  validates :description, presence: true
  validates :price, presence: true, :numericality => {:greater_than_or_equal_to => 0}
  validates :stock, presence: true, :numericality => {:greater_than_or_equal_to => 0}

  has_attached_file :product_image, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /\Aimage\/.*\z/
end
