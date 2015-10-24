class OrdersController < ApplicationController

  def index
    @orders = Order.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @order = get_order

    respond_to do |format|
      format.json { render :json => {order: @order} }
      format.html
    end
  end

  def pay
    @order = get_order
    @order.status = true
    @order.save
    respond_to do |format|
      format.json { render :json => @order, status => 200 }
    end
  end

  def destroy
    @order = get_order
    @order.destroy

    respond_to do |format|
      format.json { render :nothing => true, :status => 200 }
      format.html { redirect_to :action => :index }
    end
  end

  def create
    order_details = params[:order_details]

    if order_details.to_a.empty?
      render :json => {order: nil}
    end

    @order = Order.new

    @order.user = User.first
    @order.oid = UUIDTools::UUID.random_create.to_i.to_s
    @order.status = false
    @order.amount = 0
    @order.process = false
    @order.save

    order_details.each do |detail|
      order_detail = OrderDetail.new
      order_detail.product = Product.find_by_pid(detail[:pid])
      order_detail.order = @order
      order_detail.price = detail[:price]
      order_detail.count = detail[:count]
      order_detail.save
    end


    render :json => @order

  end

  private

  def get_order
    Order.find_by_oid(params[:oid])
  end
end
