class QuizzesController < ApplicationController
    before_action :set_quiz, only: [:show, :edit, :update, :destroy]

    # GET /quizzes
    # GET /quizzes.json
    def index
        @quizzes = Quiz.all
    end

    # GET /quizzes/1
    # GET /quizzes/1.json
    def show
        @quiz = Quiz.find(params[:id])
    end

    # GET /quizzes/new
    def new
        Rails.logger.debug "new----------------------------"
        @quiz = Quiz.new
        # if project is related
        #        if params[:project_id] != nil
        session[:project_id] = params[:project_id]
        binding.pry
        #  @project = Project.find(params[:project_id])
        #  Rails.logger.debug @project.id
        #  binding.pry_remote
        #        end 
    end

    # GET /quizzes/1/edit
    def edit
        #binding.pry
    end

    # POST /quizzes
    # POST /quizzes.json
    def create
        @project = Project.find_by_id(session[:project_id])
        if @project then
            @quiz = @project.quizzes.build(quiz_params)
            respond_to do |format|
                if @project.save
                    format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
                    format.json { render action: 'show', status: :created, location: @quiz }
                else
                    format.html { render action: 'new' }
                    format.json { render json: @quiz.errors, status: :unprocessable_entity }
                end
            end
        else
            @quiz = Quiz.new(quiz_params)
            respond_to do |format|
                if @quiz.save
                    format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
                    format.json { render action: 'show', status: :created, location: @quiz }
                else
                    format.html { render action: 'new' }
                    format.json { render json: @quiz.errors, status: :unprocessable_entity }
                end
            end
            session[:project_id]=nil
        end
    end

    # PATCH/PUT /quizzes/1
    # PATCH/PUT /quizzes/1.json
    def update
        respond_to do |format|
            if @quiz.update(quiz_params)
                format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @quiz.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /quizzes/1
    # DELETE /quizzes/1.json
    def destroy
        @quiz.destroy
        respond_to do |format|
            format.html { redirect_to quizzes_url }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
        @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
        params.require(:quiz).permit(:quiz_title, :owner_user_id, :quiz_text, :project_id, :quiz_parts1, :quiz_parts2, :quiz_parts3, :quiz_parts4 )
    end
end
