class HomesController < ApplicationController
    def index
        @users = User.all
        #     @user_name = User.find(params[:session])
        @events = Event.all
    end

    def ta_index
        binding.pry
        @users = User.all
        #     @user_name = User.find(params[:session])
        @events = Event.all
    end
  
end