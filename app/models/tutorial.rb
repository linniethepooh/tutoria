class Tutorial < ApplicationRecord
  belongs_to :company
  has_many :steps
  validates :subtitle, :product, :title, :description, :company, :file, presence: true
end
