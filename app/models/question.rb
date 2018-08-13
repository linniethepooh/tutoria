class Question < ApplicationRecord
  belongs_to :step
  validates :content, :step, presence: true
  has_one :answer
end
