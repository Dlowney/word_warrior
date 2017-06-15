class Level < ApplicationRecord
  has_many :head_words
  has_many :questions, through: :head_words

  def self.questions_per_level(user_id)
    Level.connection.select_all("
      SELECT levels.id, COUNT(*)
      FROM levels
      INNER JOIN head_words ON head_words.level_id = levels.id
      INNER JOIN questions ON questions.head_word_id = head_words.id
      INNER JOIN answers ON answers.question_id = questions.id
      INNER JOIN attempts ON attempts.id = answers.attempt_id
      WHERE attempts.user_id = #{user_id}
      GROUP BY levels.id
    ")
  end

  def self.correct_questions_per_level(user_id)
    self.connection.select_all("
      SELECT levels.id, COUNT(*)
      FROM levels
      INNER JOIN head_words ON head_words.level_id = levels.id
      INNER JOIN questions ON questions.head_word_id = head_words.id
      INNER JOIN answers ON answers.question_id = questions.id
      INNER JOIN attempts ON attempts.id = answers.attempt_id
      WHERE attempts.user_id = #{user_id}
      AND answers.correct = true
      GROUP BY levels.id
    ")
  end
end
