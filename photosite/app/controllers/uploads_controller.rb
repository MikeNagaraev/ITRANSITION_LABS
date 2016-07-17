class UploadsController < ApplicationController
  def new
  	@upload = Upload.new
  end

  def create
  	@user = User.find(params[:user_id])
	@upload = @user.uploads.create(upload_params)
  	if @upload.save
  	  render json: { message: "success" }, :status => 200
  	  @result = Cloudinary::Uploader.upload @upload.image.path
  	  @upload["public_id"] = @result["public_id"]
	  @user.uploads.push(@upload)
  	else
  	  #  you need to send an error header, otherwise Dropzone
          #  will not interpret the response as an error:
  	  render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
  	end  		
  end

  private
  def upload_params
  	params.require(:upload).permit(:image)
  end
end
