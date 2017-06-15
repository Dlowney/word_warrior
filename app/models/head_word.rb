class HeadWord < ApplicationRecord
  belongs_to :level
  has_many :questions
  has_many :answers, through: :questions

  # @return Array<HeadWord>
  def self.completed_collection(user_id)
    HeadWord.find_by_sql("
      SELECT head_words.*, answers.count
      FROM head_words
      INNER JOIN questions ON questions.head_word_id = head_words.id
      INNER JOIN answers ON answers.question_id = questions.id
      INNER JOIN attempts ON answers.attempt_id = attempts.id
      WHERE answers.correct = true
      AND attempts.user_id = #{user_id}
      GROUP BY head_words.id
      HAVING answers.count >= 10
    ")
  end

  # @return Hash<Array<HeadWord>>
  def self.completed_collection_group_by_level(user_id)
    completed_collection = self.completed_collection(user_id)
    completed_collection.group_by(&:level_id)
  end

  # @return Array<HeadWord>
  def self.completed_by_level(user_id, level_id)
    completed_collection = self.completed_collection(user_id)
    completed_collection.select { |hw| hw.level_id == level_id }
  end
end
