# order_items is table to store all product inside order
class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :cart_item, foreign_key: true

      t.timestamps
    end
  end
end
