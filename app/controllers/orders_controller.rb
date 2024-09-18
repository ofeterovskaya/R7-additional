class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'Order was successfully created.'
    else
      @customers = Customer.all
      render :new, status: :unprocessable_entity
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      flash.notice = "The order record was updated successfully."
      redirect_to @order
    else
      @customers = Customer.all
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    begin
      @order.destroy
      flash.notice = "Order was successfully destroyed."
    rescue ActiveRecord::InvalidForeignKey
      flash.alert = 'Cannot delete order because it has associated records.'
    end

    redirect_to orders_url
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product_name, :product_count, :customer_id)
  end

  def catch_not_found(e)
    Rails.logger.debug("We had a not found exception.")
    flash.alert = e.to_s
    redirect_to orders_path
  end
end
