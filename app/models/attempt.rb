class Attempt < ApplicationRecord
  has_many :answers
  has_many :questions, through: :answers
  belongs_to :user
end
