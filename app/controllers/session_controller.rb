class SessionController < ApplicationController

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            flash[:success] = "Logged in!"
            redirect_to user
        else
            flash[:danger] = "User doesn't exist."
            redirect_to root_url
        end
    end

    def destroy
        log_out
        flash[:info] = "Logged out!"
        redirect_to root_url
    end
end
