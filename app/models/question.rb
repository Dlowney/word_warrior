class Question < ApplicationRecord
  has_many :answers
  has_many :attempts, through: :answers
end


# #calculate score(missing_word, user_input)
# wrong_answer = []

# if mw and ui == then its correct
#   if not, then wrong answer << user input
#     if wrong_answer != nil then results.wrong_answers = wrong_answer

# #grabbing the wrong answers

