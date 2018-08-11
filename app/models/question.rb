class Question < ApplicationRecord
  belongs_to :step
  validates :content, :headline, presence: true
end
