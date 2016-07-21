class SlideShowController < ApplicationController
  def index
  	
  end

  def new 
    @user = User.find(params[:id])
  	@slide_show = SlideShow.new
  end 

  def create
  	@user = User.find(params[:id])
  	@slide_show = @user.slide_shows.create()
  	if @slide_show.save
  		@user.slide_shows.push(@slide_show)
  end
    end

  def show
    @user = User.find(params[:id])
  end

end
