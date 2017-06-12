class Level < ApplicationRecord
  has_many :head_words
  has_many :questions, through: :head_words
end
