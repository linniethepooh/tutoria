class ResizeJob < ApplicationJob
  queue_as :default

  def perform(tutorial_id)
    tutorial = Tutorial.find(tutorial_id)
    files = Resize.new.perform(tutorial.file)
    tutorial = Tutorial.find(tutorial_id)
    tutorial.filehigh = files[0]
    tutorial.filemedium = files[1]
    tutorial.filelow = files[2]
    tutorial.save
  end
end
