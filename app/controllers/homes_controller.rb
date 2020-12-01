class HomesController < ApplicationController
    def index
        @users = User.all
        #     @user_name = User.find(params[:session])
        @events = Event.all
    end
end
