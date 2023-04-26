class UsersController < ApplicationController
   before_action :set_user, only: [:edit,:update,:show,:create]
	def index
		 @users = User.all.limit(2).order(created_at: :desc)
		

 
	end
	def show
		

	end
   
	def edit
		
		
	end
		
	 

	  def update

		

	  	if @users.update(user_params)
	  	 redirect_to users_path,notice: 'user is #{@users.email} sucefully update'


	  	else
	  		render :edit

	    end

	  end 

	  private
	  def set_user
	  	@users = User.find(params[:id])

	  end
	    def user_params
	    	params.require(:user).permit({role_ids: []})
	    end

end