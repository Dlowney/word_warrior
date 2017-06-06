class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :sentence
      t.string :missing_word

      t.timestamps
    end
  end
end
