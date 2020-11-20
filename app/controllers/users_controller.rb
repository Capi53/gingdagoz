class UsersController < ApplicationController
     def index
       @users = User.all
     end
  
     def show
       @user = current_user

       #自分が参加しているメッセージルーム情報を取得する
       @currentUserEntry = Entry.where(user_id: current_user.id)
       #選択したユーザのメッセージルーム情報を取得する
       @userEntry = Entry.where(user_id: @user.id)

       #current_userと選択したユーザ間に共通のメッセージルームが存在すればフラグを立てる
       unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        #無ければ作る
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
     end
  
     def new
       @user = User.new
     end
  
   def create
      @user = User.new(user_params)
    # debugger
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
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
  
