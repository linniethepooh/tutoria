class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :headline, :question, presence: true
end
