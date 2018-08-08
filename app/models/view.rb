class View < ApplicationRecord
  validates :start_time, :end_time, :location, :device, presence: true
end
