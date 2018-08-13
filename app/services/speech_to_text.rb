require "open-uri"
require "google/cloud/storage"

class SpeechToText


  def perform(url)
    #get_file(url)
    #file_name = convert_mp4_to_flac("./app/assets/images/converting.mp4")
    #random_number = upload_voice
    speech = Google::Cloud::Speech.new
    #uri = "gs://tutoria_videos/#{random_number}.flac"
    uri = "gs://tutoria_videos/22377223.flac"
    config = { encoding:          :FLAC,
               language_code:     "en-US",
               enable_word_time_offsets: true,
                  }
    audio  = { uri: uri }
    operation = speech.long_running_recognize(config, audio)
    puts "Operation started"
    operation.wait_until_done!
    raise operation.results.message if operation.error?
    results = operation.response.results
    results.each do | result |
      alternatives = result.alternatives
      alternatives.each do |alternative|
        puts "Transcription: #{alternative.transcript}"
        alternative.words.each do |word|
          start_time = word.start_time.seconds + word.start_time.nanos/1000000000.0
          end_time   = word.end_time.seconds + word.end_time.nanos/1000000000.0

        #   puts "Word: #{word.word} #{start_time} #{end_time}"
        end
      end
    end
    clean_files("./app/assets/images/converting.mp4")
  end

  private

  def convert_mp4_to_flac(mp4_path)
    flac_path = mp4_path.gsub(".mp4", ".flac")
    system("ffmpeg -i #{mp4_path} #{flac_path}")
    flac_mono_path = "#{mp4_path.gsub(".mp4", "mono.flac")}"
    system("ffmpeg -i #{flac_path} -ac 1 #{flac_mono_path}")
    return flac_mono_path
  end

  def clean_files(mp4_path)
    flac_path = mp4_path.gsub(".mp4", ".flac")
    flac_mono_path = "#{mp4_path.gsub(".mp4", "mono.flac")}"
    system("rm #{mp4_path}")
    system("rm #{flac_path}")
    system("rm #{flac_mono_path}")
  end

  def get_file(url)
    File.open("./app/assets/images/converting.mp4", "wb") do |saved_file|
      open(url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end

  def storage_bucket
    @storage_bucket ||= begin
      config = Rails.application.config.x.settings
      storage = Google::Cloud::Storage.new project_id: config["project_id"],
                                           credentials: config["keyfile"]
      storage.bucket config["gcs_bucket"]
    end
  end

  def upload_voice
    storage_bucket
    random_number = rand(1..99999999)
    file = @storage_bucket.create_file "./app/assets/images/convertingmono.flac", "#{random_number}.flac"
    return random_number
  end
end
