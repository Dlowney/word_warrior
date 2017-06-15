class LevelsController < ApplicationController
  def index
    @levels = Level.all
    @completed_head_words_group_by_level = HeadWord.completed_collection_group_by_level(current_user.id)
  end

  def show
    @level = Level.find(params[:id])
    @head_words = @level.head_words
    @completed_hw = HeadWord.completed_by_level(current_user.id, @level.id)
    @incomplete_hw = @head_words - @completed_hw
  end
end
