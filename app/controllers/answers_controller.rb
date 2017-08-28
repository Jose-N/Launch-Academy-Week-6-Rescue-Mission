class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      redirect_to question_path(@question), notice: "Answer Successfully Submitted"
    else
      render :'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:description)
    end
end
