class UsersController < ApplicationController
    skip_before_action :login_required, only:[:new, :create]

    def index
    end

    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            log_in(user)
            current_user
            redirect_to root_path
        else
            render new_user_path    
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    def delete
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
