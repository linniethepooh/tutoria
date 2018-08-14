class CaptionJob < ApplicationJob
  queue_as :default

  def perform(tutorial)
    subtiltes = SpeechToText.new.perform(tutorial.file)
    tutorial.rawsubtitles = subtiltes[1]
    tutorial.subtitle = subtiltes[0]
    tutorial.save
  end
end
