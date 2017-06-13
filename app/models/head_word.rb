class HeadWord < ApplicationRecord
  belongs_to :level
  has_many :questions
  has_many :answers, through: :questions

  def completed?(user)
    # Did the user correctly answer 10 questions belonging to this head word?
    #
    # are there 10 correct answers
    # from the current_user
    # belonging to any questions
    # which belong to this head word

    user.correct_answers_for_head_word(self.id).size >= 10
  end
end
