class SessionsController < ApplicationController

    before_action :require_logout, only: [:new , :create]

    def new 
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "Successfully Logged in"
            redirect_to root_path
        else
            flash.now[:error] = "There was something wrong with your information"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy 
        session[:user_id] = nil
        flash[:success] = "Successfully logged out"
        redirect_to login_path
    end

    private
    def require_logout
        if logged_in?
            flash[:alert] = "You are already logged in!, you must log out first."
            redirect_to root_path
        end
    end
end
