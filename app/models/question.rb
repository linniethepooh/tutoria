class Question < ApplicationRecord
  belongs_to :step
  validates :content, :headline, :step, presence:, :true
end
