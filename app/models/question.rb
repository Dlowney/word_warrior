class Question < ApplicationRecord
  has_many :answers
  has_many :attempts, through: :answers
  belongs_to :head_word
end
