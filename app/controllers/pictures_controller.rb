class PicturesController < ApplicationController
  before_action :set_picture, only:[:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
    if @picture.save
      ContactMailer.contact_mail(@picture).deliver #投稿した時にメイラーのメソッドを呼び出す。
    #redirect_to pictures_path, notice:"投稿を保存しました"
        redirect_to  contact_mail_picture_path(@picture), notice: "投稿を保存しました"
    else
      render :new
    end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    if @picture.user_id != current_user.id
      redirect_to pictures_path, notice: "他人の投稿なので編集できません"
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  def destroy
    if @picture.user_id != current_user.id
      redirect_to pictures_path, notice: "他人の投稿なので削除できません"
    else
    @picture.destroy
    redirect_to pictures_path, notice:"投稿を削除しました"
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def contact_mail
    @picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
