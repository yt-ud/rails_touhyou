class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user&& user.authenticate(params[:password])
            log_in(user)
            current_user
            redirect_to root_path
        else
            render new_user_path
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to new_user_path
    end
end
