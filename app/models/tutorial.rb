class Tutorial < ApplicationRecord
  belongs_to :company
  has_many :steps
  has_many :questions, through: :steps
  validates :subtitle, :product, :title, :description, :company, :file, presence: true
end
