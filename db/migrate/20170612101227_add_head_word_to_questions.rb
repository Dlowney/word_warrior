class AddHeadWordToQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :head_word # remove string
    add_reference :questions, :head_word # add reference
  end
end
