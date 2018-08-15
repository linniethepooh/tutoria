class View < ApplicationRecord
  belongs_to :tutorial
  validates :start_time, :end_time, :location, :device,  :tutorial, presence: true
end
