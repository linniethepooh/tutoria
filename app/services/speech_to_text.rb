require "open-uri"
require "google/cloud/storage"

class SpeechToText
  def perform(url)
    mp4file = get_file(url)
    file_name = convert_mp4_to_flac("./app/assets/images/#{mp4file}")
    filename = upload_voice(file_name)
    speech = Google::Cloud::Speech.new
    uri = "gs://tutoria_videos/#{filename}"
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
    rawsubtitles = {}
    results.each do | result |
      alternatives = result.alternatives
      alternatives.each do |alternative|
        sentencewords = []
        alternative.words.each do |word|
          start_time = word.start_time.seconds + word.start_time.nanos/1000000000.0
          end_time   = word.end_time.seconds + word.end_time.nanos/1000000000.0
          wordarray = []
          wordarray = [word.word, start_time, end_time]
          sentencewords << wordarray
        end
        if sentencewords[-1][2] - sentencewords[0][1] >= 12
          cut_time = (sentencewords[-1][2] - sentencewords[0][1]) / 2
          part1 = []
          part2 = []
          sentencewords.each do | wordarray |
            if wordarray[1] <= sentencewords[0][1] + cut_time
              part1 << wordarray
            else
              part2 << wordarray
            end
          end
          sentence1 = []
          sentence2 = []
          part1.each do | wordarray |
            sentence1 << wordarray[0]
          end
          part2.each do | wordarray |
            sentence2 << wordarray[0]
          end
          key1 = sentence1.join(" ").to_sym
          rawsubtitles[key1] = part1
          key2 = sentence2.join(" ").to_sym
          rawsubtitles[key2] = part2
        else
          key = alternative.transcript.to_sym
          rawsubtitles[key] = sentencewords
        end
      end
    end
    subtilte_file = write_webvtt(rawsubtitles)
    clean_files("./app/assets/images/#{mp4file}")
    return [upload_subtitle(subtilte_file), rawsubtitles]
  end

  def write_webvtt(rawsubtitles)
    filename = DateTime.now.strftime('%Q') + ".vtt"
    File.open("./app/assets/images/#{filename}", "w") do |file|
      file << "WEBVTT\n"
      file << "\n"
      rawsubtitles.keys.each do | key |
        start_minutes = (rawsubtitles[key][0][1] / 60).floor
        start_minutes = "%.2i" %start_minutes
        start_seconds = (rawsubtitles[key][0][1] % 60).round(0)
        start_seconds = "%.2i" %start_seconds
        start_miliseconds = rawsubtitles[key][0][1].to_s[-1] + "00"
        end_minutes = (rawsubtitles[key][-1][2] / 60).floor
        end_minutes = "%.2i" %end_minutes
        end_seconds = (rawsubtitles[key][-1][2] % 60).round(0)
        end_seconds = "%.2i" %end_seconds
        end_miliseconds = rawsubtitles[key][-1][2].to_s[-1] + "00"
        file << "#{start_minutes}:#{start_seconds}.#{start_miliseconds} --> #{end_minutes}:#{end_seconds}.#{end_miliseconds}\n"
        file << "#{key.to_s}\n"
        file << "\n"
      end
    end
    return filename
  end

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
    mp4file = DateTime.now.strftime('%Q') + ".mp4"
    File.open("./app/assets/images/#{mp4file}", "wb") do |saved_file|
      open(url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
    return mp4file
  end

  def storage_bucket
    @storage_bucket ||= begin
      config = Rails.application.config.x.settings
      storage = Google::Cloud::Storage.new project_id: config["project_id"],
                                           credentials: config["keyfile"]
      storage.bucket config["gcs_bucket"]
    end
  end

  def upload_voice(mono_file)
    storage_bucket
    filename = DateTime.now.strftime('%Q') + ".flac"
    file = @storage_bucket.create_file "#{mono_file}", filename
    return filename
  end

  def upload_subtitle(webvtt)
    storage_bucket
    file = @storage_bucket.create_file "./app/assets/images/#{webvtt}", webvtt
    return file
  end
end
