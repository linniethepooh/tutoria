require "shrine/storage/google_cloud_storage"

Shrine.storages = {
  cache: Shrine::Storage::GoogleCloudStorage.new(bucket: "cache"),
  store: Shrine::Storage::GoogleCloudStorage.new(bucket: "store"),
}

# Shrine::Storage::GoogleCloudStorage.new(
#   bucket: "store",
#   default_acl: 'publicRead',
#   object_options: {
#     cache_control: 'public, max-age: 7200'
#   },
#

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :backgrounding
Shrine.plugin :presign_endpoint, presign_options: -> (request) do
    filename     = request.params["filename"]
    extension    = File.extname(filename)
    content_type = Rack::Mime.mime_type(extension)

    {
      content_type: content_type
    }
end
