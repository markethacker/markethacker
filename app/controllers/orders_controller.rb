class OrdersController < ApplicationController

  def index
    @orders = Order.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @order = Order.find_by_oid(params[:id])

    respond_to do |format|
      format.json { render :json => @order }
      format.html
    end
  end

  def destroy
    @order = Order.find_by_oid(params[:id])
    @order.destroy

    respond_to do |format|
      format.json { render :nothing => true, :status => 200 }
      format.html { redirect_to :action => :index }
    end
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
