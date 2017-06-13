class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    @propositions = []
    @questions.each do |x|
      @propositions << x.missing_word
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = question.new(question_params)
    if @question.save
      redirect_to level_question_path(@question)
    else
      render :new
    end
  end

  def update
    @question.update(question_params)
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:sentence, :missing_word)
  end
end
