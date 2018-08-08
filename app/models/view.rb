class View < ApplicationRecord
  validates :start_time, :end_time, :location, :device,  :tutorial, presence: true
end
