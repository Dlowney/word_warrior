class LevelsController < ApplicationController
  def index
    @levels = Level.all
  end

  def show
    @level = Level.find(params[:id])
    @head_words = @level.head_words
    @completed_head_words = @head_words.select { |hw| hw.completed?(current_user) }
    @incomplete_head_words = @head_words - @completed_head_words
  end
end
