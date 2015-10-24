class OrderDetail < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  after_save :after_save_order_detail

  def after_save_order_detail
    self.order.amount += self.price*self.count
    self.order.save
  end
end
