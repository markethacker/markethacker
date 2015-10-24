class OrdersController < ApplicationController
  def update
  end

  def show
    @order = Order.find_by_oid(params[:id])
    render :json => @order
  end

  def create
    order_details = params[:order_details]

    return if order_details.to_a.empty?

    @order = Order.new

    order_details.each do |detail|
      @order.order_details << OrderDetail.create(detail)
    end

    @order.user = User.first
    @order.oid= UUID.random_create.to_s
    @order.save

    render :json => { order: @order }

  end
end
