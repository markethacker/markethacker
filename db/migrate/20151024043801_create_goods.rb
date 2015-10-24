class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :gid, null: false
      t.string :name, null: false
      t.string :desc
      t.float  :price, null:false

      t.timestamps null: false
    end
  end
end
