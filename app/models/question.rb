class Question < ApplicationRecord
  has_many :answers
  has_many :attempts, through: :answers
  belongs_to :head_word

  # def self.sample(difficulty)
   # questions.join(:head_word).joinwhere(difficulty: difficulty)
  #    Level.find_by(difficulty).head_words
  # end
end


# #calculate score(missing_word, user_input)
# wrong_answer = []

# if mw and ui == then its correct
#   if not, then wrong answer << user input
#     if wrong_answer != nil then results.wrong_answers = wrong_answer

# #grabbing the wrong answers

