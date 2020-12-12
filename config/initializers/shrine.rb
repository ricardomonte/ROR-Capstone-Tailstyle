require 'shrine'

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  s3_options = {
    access_key_id:     Rails.application.credentials.s3.access_key_id,
    secret_access_key: Rails.application.credentials.s3.secret_access_key,
    region:            Rails.application.credentials.s3.region,
    bucket:            Rails.application.credentials.s3.bucket
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
end

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :presign_endpoint



# require "shrine"
# require "shrine/storage/file_system"
# require "shrine/storage/s3"

# s3_options = Rails.application.credentials.s3

# Shrine.storages = {
#   cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
#   store: Shrine::Storage::S3.new(**s3_options),
# }

# Shrine.plugin :activerecord           # loads Active Record integration
# Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
# Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
# Shrine.plugin :presign_endpoint

