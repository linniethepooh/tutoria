class CaptionJob < ApplicationJob
  queue_as :default

  def perform(tutorial_id)
    tutorial = Tutorial.find(tutorial_id)
    subtiltes = SpeechToText.new.perform(tutorial.file)
    tutorial = Tutorial.find(tutorial_id)
    tutorial.rawsubtitles = subtiltes[1]
    tutorial.subtitle = subtiltes[0]
    tutorial.save
  end
end
