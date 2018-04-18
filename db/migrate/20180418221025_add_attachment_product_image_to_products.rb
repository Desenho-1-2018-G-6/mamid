class AddAttachmentProductImageToProducts < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |t|
      t.attachment :product_image
    end
  end

  def self.down
    remove_attachment :products, :product_image
  end
end
