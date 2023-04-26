class OrdersController < ApplicationController
  before_action :current_cart
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @current_cart.line_items.each do |item|
      
      @order.line_items << item
  
      
    
    end
    byebug
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end
  
  
  private
    def order_params
      params.require(:order).permit(:name, :email, :address,:user_id)
    end
end
