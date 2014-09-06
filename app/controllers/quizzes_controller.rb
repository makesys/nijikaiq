class QuizzesController < ApplicationController
    before_action :set_quiz, only: [:show, :edit, :update, :destroy]
    before_action :set_project

    # GET /quizzes
    # GET /quizzes.json
    def index
        @quizzes = Quiz.all
    end

    # GET /quizzes/1
    # GET /quizzes/1.json
    def show
        @username = User.find_by_id(@quiz.owner_user_id).name
    end

    # GET /quizzes/new
    def new
        @quiz = Quiz.new
    end

    # GET /quizzes/1/edit
    def edit
    end

    # POST /quizzes
    # POST /quizzes.json
    def create
        if @project then
            @quiz = @project.quizzes.build(quiz_params)
            @quiz.order = @project.quizzes.size + 1 
            @quiz.owner_user_id = session[:user_id]
            respond_to do |format|
                if @project.save
                    format.html { redirect_to @quiz, notice: 'クイズの登録が完了しました.' }
                    format.json { render action: 'show', status: :created, location: @quiz }
                else
                    format.html { render action: 'new' }
                    format.json { render json: @quiz.errors, status: :unprocessable_entity }
                end
            end
        else
            @quiz = Quiz.new(quiz_params)
            @quiz.owner_user_id = session[:user_id]
            respond_to do |format|
                if @quiz.save
                    format.html { redirect_to @quiz, notice: 'クイズの登録が完了しました。' }
                    format.json { render action: 'show', status: :created, location: @quiz }
                else
                    format.html { render action: 'new' }
                    format.json { render json: @quiz.errors, status: :unprocessable_entity }
                end
            end
            session[:project_id]=nil
        end
    end

    # PATCH/PUT /quizzes/1/edit
    # PATCH/PUT /quizzes/1/edit.json
    def update
        respond_to do |format|
            if @quiz.update(quiz_params)
                format.html { redirect_to @quiz, notice: 'クイズの更新が完了しました。' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @quiz.errors, status: :unprocessable_entity }
            end
        end
    end

    def updateorder
        # 順序を上げるクイズを取得
        @quizdst =  Quiz.find(params[:id])
        tmpnum = @quizdst.order
        
        # セッションからプロジェクトIDを取得
        projid = session[:project_id]
        project = Project.find(projid)

        # すでに選択したクイズが１番目だったら処理終了
        if tmpnum == 1 then
            flash[:notice] = 'すでに１番目に設定されています'
        else 
            # 上位順序だったクイズの順序を１つ下げる
            for q in project.quizzes do
                if q.order == tmpnum-1 then
                    @quizsrc= q
                    @quizsrc.order = tmpnum
                    @quizsrc.save
                    break
                end 
            end

            # 順序を上げるクイズの順序を１つ上げる
            @quizdst.order = tmpnum -1
            @quizdst.save
            flash[:notice] = '順番を更新しました'
        end
        redirect_to :controller => "projects", :action => "show", :id => projid  

    end

    # DELETE /quizzes/1
    # DELETE /quizzes/1.json
    def destroy
        @quiz.destroy
        respond_to do |format|
            projid = session[:project_id]
            flash[:notice] = 'クイズの削除が完了しました'
            format.html { redirect_to :controller => "projects", :action => "show", :id => projid } 
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
        @quiz = Quiz.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
        @project = Project.find_by_id(session[:project_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
        params.require(:quiz).permit(:quiz_title, :owner_user_id, :quiz_text, :project_id, :quiz_parts1, :quiz_parts2, :quiz_parts3, :quiz_parts4, :order, :answer )
    end
end
