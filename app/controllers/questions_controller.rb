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

  def save_answers
    @answers_hash = params[:choice]
    @answers_hash.each do |question_id, user_input|
      Answer.create(
        question_id: question_id,
        user_input: user_input,
        user_id: current_user.id
      )
    end
    redirect_to request.referer
  end


  def show_results
  end

  def create
    @question = question.new(question_params)
    if @question.save
      redirect_to questions_path
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
