class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @attempts = Attempt.find(params[:id])
    @answers = Answer.find(params[:id])
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
