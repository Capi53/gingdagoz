class UsersController < ApplicationController
     def index
       @users = User.all
     end
  
     def show
       @user = User.find(params[:id])
     end
  
     def new
       @user = User.new
     end
  
   def create
      @user = User.new(user_params)
    # debugger
      if @user.save
        redirect_to @user
      else
        render 'new'
      end
#      @users = User.new(params[:user])
#      respond_to do |format|
# 
   end
  
     private
     def user_params
       params.require(:user).permit(:role_id, :name, :email, :password)
     end
  end
  
