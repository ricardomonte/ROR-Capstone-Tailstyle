class ImageUploader < Shrine
  plugin :presign_endpoint, presign_options: -> (request) {
  # Uppy will send the "filename" and "type" query parameters
    filename = request.params["filename"]
    type     = request.params["type"]

    {
      content_disposition:    ContentDisposition.inline(filename), # set download filename
      content_type:           type,                                # set content type (defaults to "application/octet-stream")
      content_length_range:   0..(10*1024*1024),                   # limit upload size to 10 MB
    }
  }
end