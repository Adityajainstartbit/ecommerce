class ApplicationController < ActionController::Base
  

    before_action :current_cart
    layout :set_layout
   
    include Pagy::Backend
    before_action :set_categories
   

    def set_categories
      @categories = Category.all
    end
    helper_method :current_cart 
    private
    def current_cart
      if session[:cart_id]
        @current_cart = Cart.find_by(id: session[:cart_id])
        session[:cart_id] = nil unless @current_cart
      end
    
      unless @current_cart
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    
      @current_cart
    end 
  #  def current_cart
  #    if user_signed_in?
      
  #      @current_cart ||= current_user.cart || Cart.create(user_id: current_user.id)
  #    end
  #  end
   
      def set_layout
        
          if user_signed_in? && current_user.has_role?(:admin)
            'admin'
          else
            'customer'
          end
        
      end
end
