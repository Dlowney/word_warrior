class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @head_words = HeadWord.all
    @total_completed_words = HeadWord.completed_collection(@user.id)
    @total_accuracy = @user.total_accuracy

    @levels = Level.all
    @completed_head_words_group_by_level = HeadWord.completed_collection_group_by_level(@user.id)
    @questions_per_level = Level.questions_per_level(@user.id).rows
    @correct_questions_per_level = Level.correct_questions_per_level(@user.id).rows

    @correct_and_total_questions = @questions_per_level.reduce({}) do |memo, qpl|
      level_id = qpl[0]
      memo[level_id] ||= []
      memo[level_id] << qpl[1]
      memo
    end

    @correct_questions_per_level.each do |cqpl|
      level_id = cqpl[0]
      @correct_and_total_questions[level_id] << cqpl[1]
    end
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
      if @user.save
        redirect_to users_path
      else
        render :new
      end
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

private
  def user_params
    params.require(:user).permit(:email)
  end

end
