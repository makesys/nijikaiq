class SlidesController < ApplicationController
    def index
    end

    def top
        @tmp = "test"
    end

    def project
        tmp = params[:projcode]
        @project = Project.find_by(projcode: tmp)
        # 今なん問目かを表す番号を初期化
        session[:order] = 1
    end

    def quiz
        # 今なん問目かを表す番号を取得
        @num = session[:order]
        # 所属プロジェクトを取得
        @project = Project.find_by_id(params[:id])
        # order番目のクイズを取得
        for quiz in @project.quizzes do
            if quiz.order == @num then
                @quiz= quiz
                break
            end 
        end
        # 該当のクイズがない場合は終了
        if @quiz == nil
            redirect_to current_user
            #            @quiz.quiz_title = "問題が登録されていません。別のIDをご指定ください。"
        end
    end

    # POST /slides/answer
    # POST /slides/answer.json
    def answer
        @num = session[:order]
        @quiz = Quiz.find_by_id(params[:quiz][:id])
        @project = Project.find_by_id(params[:project][:id])
        if params[:answer_select] != nil then
            if @quiz.answer == params[:answer_select][:index]
                flash[:notice] ='seikai'
                # 正解の場合
                @ansFlg=1
            else
                # 不正解の場合
                @ansFlg=2 
            end
        else
            # 解答が未入力の場合
            @ansFlg =3
        end
        render action:'quiz' 
    end
    
    def nextquiz
        countupOrder
        tmpnum = params[:project][:id] 
        redirect_to action: 'quiz', id: tmpnum
    end


    private 
    
    def countupOrder
        tmpnum = session[:order]
        session[:order] = tmpnum + 1
    end

end
