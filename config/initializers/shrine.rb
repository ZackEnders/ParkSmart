require "shrine"
require "shrine/storage/file_system"
require "image_processing/mini_magick"

 
Shrine.plugin :activerecord
# Logger will simply output some debugging information inside the 
# console for you saying how much time was spent to process a file.
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :validation_helpers

 
Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
}
#All uploaded files will be stored inside the public/uploads directory. 

