class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find(params[:id])
    @answers = @attempt.answers
    @questions = @attempt.questions

    @user_input = []
    @answers.each do |y|
      @user_input << y.user_input
    end
  end

  def new
    @attempt = Attempt.new
    @questions = Question.all
    @propositions = []
    @questions.each do |x|
      @propositions << x.missing_word
    end
  end

  def create
    @attempt = Attempt.create(user: current_user)

    @answers_hash = params[:choice]
    @answers_hash.each do |question_id, user_input|
      @attempt.answers.create(
        question_id: question_id,
        user_input: user_input,
      )
    end

    redirect_to attempt_path(@attempt)
  end
end
