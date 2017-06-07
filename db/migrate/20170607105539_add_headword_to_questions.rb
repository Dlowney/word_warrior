class AddHeadwordToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :head_word, :string
  end
end
