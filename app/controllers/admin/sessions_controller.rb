class Admin::SessionsController < Devise::SessionsController
    before_action :authenticate_user!, except: [:new, :create]
    
    def new
      self.resource = User.new
    end
  
    def create
      user = User.find_by(email: params[:user][:email])
      if user && user.has_role? == "admin"
        super
      else
        flash[:alert] = "You are not authorized to access this page"
        redirect_to root_path
      end
    end
  end