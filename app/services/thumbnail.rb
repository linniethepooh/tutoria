class Thumbnail

  def perform(video_url)
    file = get_file(video_url)
    upload_file = file[0..-5].dup
    upload_file = upload_file + ".png"
    file.prepend("./app/assets/images/")
    system("ffmpeg -i #{file} -ss 00:00:10.000 -vframes 1 #{file[0..-5]}.png")
    system("rm #{file}")
    image = VideoUploader.new.perform("#{upload_file}").media_url
    system("rm #{file[0..-5]}.png")
    return image
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
