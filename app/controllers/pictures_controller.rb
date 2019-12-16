class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(title: params[:picture][:title],content: params[:picture][:content],image: params[:picture][:image])

    redirect_to new_picture_path
  end

  def show
   @picture = Picture.find(params[:id])
  end

  private

  def blog_params
    prams.require(:picture).permit(:title, :content, :image)
  end
end
