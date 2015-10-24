class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :oid, null:false
      t.references :user, null:false
      t.boolean :status, null:false
      t.float :amount
      t.timestamps null: false
    end
  end
end
