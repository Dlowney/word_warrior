class AddLevelToHeadWords < ActiveRecord::Migration[5.1]
  def change
    add_reference :head_words, :level
  end
end
