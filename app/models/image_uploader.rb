require "image_processing/mini_magick"

class ImageUploader < Shrine
	include ImageProcessing::MiniMagick
  	plugin :processing
  	plugin :versions
		plugin :determine_mime_type
		plugin :cached_attachment_data
  	plugin :delete_raw
	Attacher.validate do
    validate_max_size 3.megabyte, message: "is too large (max is 3 MB)"
    validate_mime_type_inclusion ['image/jpg', 'image/jpeg', 'image/png']
	end
#Processes the code and stores it's 2 verisons of the file.
#Full size and a 300x300 version.
	process(:store) do |io|
    original = io.download
    processor = ImageProcessing::MiniMagick

    size_800 = processor.source(original).resize_to_limit!(800, 800)
    size_500 = processor.source(size_800).resize_to_limit!(500, 500)
    size_300 = processor.source(size_500).resize_to_limit!(300, 300)

    original.close!

    { original: io, large: size_800, medium: size_500, small: size_300 }

	 	# resize_to_limit! is part of the image_processing gem. 
	 	# If the image is larger it shrinks it down to 300x300
	 	# It keeps the original aspect ratio, so smaller images don't stretch
	end
end

