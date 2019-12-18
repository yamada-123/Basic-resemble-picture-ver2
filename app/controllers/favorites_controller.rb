class FavoritesController < ApplicationController
  def create
    binding.pry
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.pictiure.user.name}さんのブログをお気に入り解除しました"
  end

  def index
    @favorite_pictures = current_user.favorite_pictures
  end

end