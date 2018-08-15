require "google/cloud/storage"

class VideoUploader

  def perform(file)
    filename = DateTime.now.strftime('%Q') + file
    storage_bucket
    file = @storage_bucket.create_file "./app/assets/images/#{file}", filename
    return file
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

  private

  def storage_bucket
    @storage_bucket ||= begin
      config = Rails.application.config.x.settings
      storage = Google::Cloud::Storage.new project_id: config["project_id"],
                                           credentials: config["keyfile"]
      storage.bucket config["gcs_bucket"]
    end
  end
end
