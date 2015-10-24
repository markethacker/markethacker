class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :uid, null: false
      t.string :name, null:false
      t.string :pass, null:false
      t.timestamps null: false
    end
  end
end
