class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email:params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in @user
      if current_user.ta?
        redirect_to homes_ta_index_path
      elsif current_user.teacher?
        redirect_to users_path
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
