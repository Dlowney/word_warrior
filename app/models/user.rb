class User < ApplicationRecord
 has_many :attempts
 has_many :answers, through: :attempts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def correct_answers
    answers.where(correct: true)
  end

  def correct_answers_for_head_word(head_word_id)
    correct_answers.joins(:question)
                   .where(questions: { head_word_id: head_word_id })
  end
end
