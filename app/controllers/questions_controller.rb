class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new()
  end

  def new
    @question = Question.new()
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Question Successfully Created"
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Successfully Updated Question"
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path, notice: 'Question Successfully Deleted'
  end

  private
    def question_params
      params.require(:question).permit(:name, :description)
    end
end
