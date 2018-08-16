class Resize

  def perform(video_url)
    file_name = get_file(video_url)
    upload_file = file_name.dup
    file_name.prepend("./app/assets/images/")
    video_resolution = `ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 #{file_name}`
    original_height = video_resolution.split(",").last[0..-2].to_i
    video_height = video_resolution.split(",").last[0..-2].to_i
    video_width = video_resolution.split(",").first.to_i
    # Resizing the video to appropiate sizes
    high = nil
    medium = nil
    low = nil
    if video_height > 720
      system("ffmpeg -i #{file_name} -vf scale=#{(original_height * (720 / video_width)).round }:720 #{file_name[0..-5]}_resolution_#{720}.mp4")
      high = VideoUploader.new.perform("#{upload_file[0..-4]}_resolution_#{720}.mp4").media_url
      video_height = 720
      system("rm #{file_name}")
    end
    if video_height > 480
      system("ffmpeg -i #{file_name} -vf scale=#{(original_height * (480 / video_width)).round }:480 #{file_name[0..-5]}_resolution_#{480}.mp4")
      medium = VideoUploader.new.perform("#{upload_file[0..-4]}_resolution_#{480}.mp4").media_url
      video_height = 480
      system("rm #{file_name[0..-5]}_resolution_#{720}.mp4")
    end
    if video_height > 360
      system("ffmpeg -i #{file_name} -vf scale=#{(original_height * (360 / video_width)).round }:360 #{file_name[0..-5]}_resolution_#{360}.mp4")
      low = VideoUploader.new.perform("#{upload_file[0..-4]}_resolution_#{360}.mp4").media_url
      video_height = 360
      system("rm #{file_name[0..-5]}_resolution_#{480}.mp4")
      system("rm #{file_name[0..-5]}_resolution_#{360}.mp4")
    end
    return [high, medium, low]
  end

  private

  def get_file(url)
    mp4file = DateTime.now.strftime('%Q') + ".mp4"
    File.open("./app/assets/images/#{mp4file}", "wb") do |saved_file|
      open(url, "rb") do |read_file|
        saved_file.write(read_file.read)
      end
    end
    return mp4file
  end
end

