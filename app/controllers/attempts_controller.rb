class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find(params[:id])
    @answers = @attempt.answers
    @questions = @attempt.questions

    @user_input = []
    @answers.each do |y|
      @user_input << y.user_input
    end
    compute_score
  end



  def new
    @attempt = Attempt.new
    @questions = Question.join(head_word_id: [level_id: [difficulty: 1]]).sample(5)
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

  def compute_score
    number_questions = @questions.count
    number_correct = 0
    @answers.each do |x|
      if x.user_input == x.question.missing_word
        number_correct += 1
      end
    end
    @score = "#{number_correct} / #{number_questions}"
  end
end
