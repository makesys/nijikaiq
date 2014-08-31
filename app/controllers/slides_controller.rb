class SlidesController < ApplicationController
    def index
    end

    def top
        @tmp = "test"
    end

    def quiz
        @quiz = Quiz.find_by_id(params[:id])
        if @quiz.nil? then
            @quiz = Quiz.new
            @quiz.quiz_title = "問題が登録されていません。別のIDをご指定ください。"
        end
    end

    # POST /slides/answer
    # POST /slides/answer.json
    def answer

        @quiz = Quiz.find_by_id(30)
        if params[:answer_select] != nil then
            @ansxx =  params[:answer_select][:index]
        else
            @ansxx = "回答を選択してください"
        end

        render action: 'quiz'

    end
end
