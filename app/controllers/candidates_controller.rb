class CandidatesController < ApplicationController
    before_action :new_user_path

    def index
        @myelection = current_user.elections.find(params[:myelection_id])
        @mycandidates = @myelection.candidates
    end

    def new
        @myelection = current_user.elections.find(params[:myelection_id].to_i)
        @candidate = @myelection.candidates.new
    end

    def create
        # 【課題】ストロングパラメーターのmergeメソッドが上手い事動かないので、paramsを使う。
        puts "---------------"
        puts params[:myelection]
        puts "---------------"
        @myelection = current_user.elections.find(params[:myelection_id].to_i)
        puts "---------------"
        puts @myelection
        puts "---------------"
        @candidate = @myelection.candidates.new(name: params[:name], comment: params[:comment], election_id: params[myelection_id])
        puts "---------------"
            @candidate
        puts "---------------"

        if @candidate.save
            redirect_to candidates_path(myelection_id:@candidate.election_id)
        else
            render new_candidate_path(myelection_id:@myelection.id)
        end
    end

    def show
        @candidate = Candidate.find(params[:id])
        @myelection = @candidate.election
    end

    def edit
        @candidate = Candidate.find(params[:id])
        @myelection = @candidate.election
    end

    def update
        @candidate = Candidate.find(params[:id])
        if @candidate.update(name: params[:name], comment: params[:comment])
            redirect_to candidates_path
        else
            render edit_candidate_path(params[:id])
        end
    end

    def destroy
        Candidate.find(params[:id]).delete
        redirect_to root_path
    end

    private
end
