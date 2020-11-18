class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email:params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in @user
      if current_user.role_id == 2
        redirect_to homes_index_path
      elsif current_user.role_id == 3
        redirect_to users_index_path
      else
        redirect_to homes_index_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
