class MyelectionsController < ApplicationController
    def index
        @myelection = Election.where(user_id: current_user.id)
    end

    def new
    end

    def create        
        if (params[:password] == params[:password_confirmation]) && (params[:enddate] > params[:startdate]) && (params[:startdate] > Time.now)
            #myelection = current_user.elections.new(myelection_params)
            #myelection = Election.new(myelection_params.merge(user_id: current_user.id))
            myelection = Election.new(name: params[:name], description: params[:description], password: params[:password], password_confirmation: params[:password_confirmation], startdate: params[:startdate], enddate: params[:enddate], user_id: current_user.id)            
            if myelection.save
                redirect_to myelections_path
            else
                render new_myelection_path    
            end
        else
            render new_myelection_path    
        end            
    end

    def show
        @myelection = Election.find(params[:id])
    end
    
    def edit
        @myelection = Election.find(params[:id])
    end

    def update
        @myelection = Election.find(params[:id])
        if (params[:password] == params[:password_confirmation]) && (params[:enddate] > params[:startdate]) && (params[:startdate] > Time.now)
            if @myelection.update(name: params[:name], description: params[:description], password_digest: params[:password], startdate: params[:startdate], enddate: params[:enddate], user_id: current_user.id)
                redirect_to myelections_path
            else
                render new_myelection_path    
            end
        else
            render new_myelection_path    
        end       
    end

    def destroy
        Election.find(params[:id]).delete
        redirect_to myelections_path
    end

    private

    def myelection_params
        params.require(:election).permit(:name, :description, :startdate, :enddate, :password, :password_confirmation, :user_id)
    end
end
