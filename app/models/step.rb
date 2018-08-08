class Step < ApplicationRecord
  belongs_to :tutorial
  validates :tutorial, :start_time, :description, :headline, presence: true
end
