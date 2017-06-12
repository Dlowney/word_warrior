class HeadWord < ApplicationRecord
  belongs_to :level
  has_many :questions
end
