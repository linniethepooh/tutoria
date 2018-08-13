class CaptionJob < ApplicationJob
  queue_as :default

  def perform(*args)
    speech = Google::Cloud::Speech.new
    file_name = "sade_short_interview_1992.mp4"
    audio_file = File.binread file_name
    config = { encoding:          :LINEAR16,
           sample_rate_hertz: 16000,
           language_code:     "en-US"   }
    audio  = { content: audio_file }
    response = speech.recognize config, audio
    results = response.results
    results.first.alternatives.each do |alternatives|
      puts "Transcription: #{alternatives.transcript}"
    end
  end
end
