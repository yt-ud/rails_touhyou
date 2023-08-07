class MyelectionsController < ApplicationController
    def index
        @myelection = current_user.elections
    end

    def new
    end

    def create        
        if (params[:enddate] > params[:startdate]) && (params[:startdate] > Time.now)
            # 【課題】ストロングパラメーターのmergeメソッドが上手い事動かないので、paramsを使う。
            myelection = current_user.elections.new(name: params[:name], description: params[:description], password: params[:password], startdate: params[:startdate], enddate: params[:enddate])
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
        @myelection = current_user.elections.find(params[:id])
    end

    def edit    
        @myelection = current_user.elections.find(params[:id])
    end

    def update
        @myelection = current_user.elections.find(params[:id])
        if (params[:enddate] > params[:startdate]) && (params[:startdate] > Time.now)
            if @myelection.update(name: params[:name], description: params[:description], password: params[:password], startdate: params[:startdate], enddate: params[:enddate], user_id: current_user.id)
                redirect_to myelections_path
            else
                render new_myelection_path    
            end
        else
            render new_myelection_path    
        end       
    end

    def destroy
        current_user.elections.find(params[:id]).delete
        redirect_to myelections_path
    end

    private
    # 効かないので使っていない。
    def myelection_params
        params.require(:election).permit(:name, :description, :startdate, :enddate, :password)
    end
end
