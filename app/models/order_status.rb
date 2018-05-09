class OrderStatus < ActiveRecord::Base
  has_many :orders

  def status
    nil
  end

end