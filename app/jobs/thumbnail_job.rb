class ThumbnailJob < ApplicationJob
  queue_as :default

  def perform(tutorial_id)
    tutorial = Tutorial.find(tutorial_id)
    png = Thumbnail.new.perform(tutorial.file)
    tutorial = Tutorial.find(tutorial_id)
    tutorial.image = png
    tutorial.save
  end
end
