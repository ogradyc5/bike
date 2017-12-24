class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  
  version :resized do
    # returns an image with a maximum width of 100px 
    # while maintaining the aspect ratio
    # 10000 is used to tell CW that the height is free 
    # and so that it will hit the 100 px width first
    process crop: '100x50+0+0'
    process :resize_to_fit => [50, 50]
  end
  
  # Create different versions of your uploaded files:
   version :thumb do
   #  process crop: '100x50+0+0'
     process :resize_to_fill => [80, 80]
   end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end


  private

  # Simplest way
  def crop(geometry)
    manipulate! do |img|      
      img.crop(geometry)
      img
    end    
  end

  # Resize and crop square from Center
  def resize_and_crop(size)  
    manipulate! do |image|                 
      if image[:width] < image[:height]
        remove = ((image[:height] - image[:width])/2).round 
        image.shave("0x#{remove}") 
      elsif image[:width] > image[:height] 
        remove = ((image[:width] - image[:height])/2).round
        image.shave("#{remove}x0")
      end
      image.resize("#{size}x#{size}")
      image
    end
  end
end
