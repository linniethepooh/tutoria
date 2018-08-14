class Tutorial < ApplicationRecord
  belongs_to :company
  has_many :steps
  has_many :questions, through: :steps
  validates :product, :title, :description, :company, presence: true
end
