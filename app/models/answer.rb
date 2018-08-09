class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :question, presence: true
end
