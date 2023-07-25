class MyelectionsController < ApplicationController
    def index
    end

    def new
    end

    def create
        myelection = Election.new(myelection_params)
        if myelection.save
            redirect_to myelections_path
        else
            render new_myelections_path    
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
    def myelection_params
        params.require(:election).permit(:name, :description, :password, :password_confirmation)
    end
end
