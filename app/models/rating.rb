class Rating < ApplicationRecord
  belongs_to :tutorial
  validates :tutorial, presence: true
end
