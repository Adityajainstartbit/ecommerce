class CartsController < ApplicationController
  before_action :current_cart
  def show
    @cart = @current_cart
  end

   
  # def destroy
  #   @cart = @current_cart
  #   @cart.destroy
  #   session[:cart_id] = nil
  #   redirect_to root_path
  # end
  def destroy
   
    cartId=@current_cart.id
    @current_cart.line_items.each do |line_item|
      line_item.destroy
    end
    redirect_to root_path
  end
end
