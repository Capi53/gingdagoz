class UsersController < ApplicationController
     def index
       @users = User.all
     end
  
     def show
       @user = User.find(params[:id])

       #自分が参加しているメッセージルーム情報を取得する
       @currentUserEntry = Entry.where(user_id: current_user.id)
       #洗濯したユーザのメッセージルーム情報を取得する
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
      if current_user.teacher?
        @user = User.new
      else
        redirect_to homes_index_path
      end
    end
  
   def create
      @user = User.new(user_params)
    # debugger
      if @user.save
        # log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to users_index_path #users_index_pathでuser一覧を見たい
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
  
