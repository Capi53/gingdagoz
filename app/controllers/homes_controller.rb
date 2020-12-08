class HomesController < ApplicationController
    before_action :ta_required, only: [:ta_index]

    def index
        @users = User.all
        #     @user_name = User.find(params[:session])
        @events = Event.all
    end

    def ta_index
        @users = User.all
        #     @user_name = User.find(params[:session])
        @events = Event.all
    end

    private
    def ta_required
        if current_user.teacher?
            redirect_to users_index_path
        elsif current_user.student?
            redirect_to homes_index_path
        end
    end

end