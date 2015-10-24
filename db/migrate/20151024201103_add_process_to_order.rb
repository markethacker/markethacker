class AddProcessToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :process, :boolean
  end
end
