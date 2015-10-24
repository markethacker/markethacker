class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.references :order, null:false
      t.references :goods, null:false
      t.integer :count
      t.float :price
      t.timestamps null: false
    end
  end
end
