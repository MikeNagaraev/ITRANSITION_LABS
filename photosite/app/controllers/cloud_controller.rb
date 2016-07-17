class CloudController < ApplicationController
	 before_filter :check_configuration

  def check_configuration
    render 'configuration_missing' if Cloudinary.config.api_key.blank?
  end

  def index
    upload_images
    render
  end

  private

  def local_image_path(name)
    Rails.root.join('images', name).to_s
  end

  def upload_images
    @uploads = {}
    @eager_options = {
      :width => 200, :height => 150, :crop => "scale"
    }
    @uploads[:pizza] = Cloudinary::Uploader.upload local_image_path("pizza.jpg"),:tags => "photosite",
    :public_id => "my_favorite_pizza"
    @uploads[:lake] = Cloudinary::Uploader.upload local_image_path("lake.jpg"),:tags => "photosite",
      :public_id => "blue_lake",
      :eager => @eager_options 
  end
end
