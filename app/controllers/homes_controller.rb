class HomesController < ApplicationController
    def index
        @users = User.all
    #     @user_name = User.find(params[:session])
    end
end
