class AttemptsController < ApplicationController
  before_action :set_level, only: [:show, :new, :create]

  def show
    @attempt = Attempt.find(params[:id])
    @answers = @attempt.answers.order(:question_id)

    compute_score
  end

  def new
    @attempt = Attempt.new
    @questions = @level.questions.order("RANDOM()").first(10).sort_by(&:id)
    @propositions = []
    @questions.each do |q|
      @propositions << q.missing_word
    end
  end

  def create
    @attempt = Attempt.create(user: current_user)

    @answers_hash = params[:choice]
    @answers_hash.each do |question_id, user_input|
      @question = Question.find(question_id)
      @correct = user_input == @question.missing_word

      @attempt.answers.create(
        question_id: question_id,
        user_input: user_input,
        correct: @correct
      )
    end

    redirect_to level_attempt_path(@level, @attempt)
  end

  private

  def compute_score
    number_questions = @answers.size
    number_correct = 0

    @answers.each do |x|
      if x.user_input == x.question.missing_word
        number_correct += 1
      end
    end
    @score = "#{number_correct} / #{number_questions}"
  end

  def set_level
    @level = Level.find(params[:level_id])
  end
end
