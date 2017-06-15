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

  def attempted_questions
    answers.count
  end

  def total_accuracy
    ((correct_answers.count.to_f / answers.count.to_f) * 100).round(2)
  end
end
