class Answer < ApplicationRecord
  belongs_to :question
  validates :content, :headline, presence: true
end
