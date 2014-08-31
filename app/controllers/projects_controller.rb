class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, ]
    before_filter :authorize

    def index
    end

    def edit
    end

    def show
        @project = Project.find(params[:id])
        @members = @project.quizzes
        session[:project_id]=params[:id]
    end

    def post
    end

    def new
        @project = Project.new
        @project.user = User.find(params[:user_id])
        @project.quizzes.build
    end

    def create
        @project = Project.new(project_params)
        respond_to do |format|
            if @project.save
                format.html { redirect_to @project, notice: 'Sample was successfully created.' }
                format.json { render action: 'show', status: :created, location: @project }
            else
                format.html { render action: 'new' }
                format.json { render json: @project.errors, status: :unprocessable_entity }
            end
        end
    end
    def project_params
        params.require(:project).permit(:title,:user_id)
    end

    private
    def set_project
        @project = Project.find(params[:id])
    end

end
