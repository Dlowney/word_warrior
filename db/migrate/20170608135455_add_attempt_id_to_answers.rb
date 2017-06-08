class AddAttemptIdToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :attempt
  end
end
