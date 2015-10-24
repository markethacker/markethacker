class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pid, null: false
      t.string :name, null: false
      t.float :price, null: false
      t.string :desc
      t.timestamps null: false
    end
  end
end
