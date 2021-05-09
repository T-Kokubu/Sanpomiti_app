class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    walkcourse = Walkcourse.find(params[:like_id])
    user = walkcourse.user
    current_user.like(walkcourse)
    flash[:success] = "お気に入りに追加しました"
    redirect_to user_path(user)
  end

  def destroy
    walkcourse = Walkcourse.find(params[:like_id])
    user = walkcourse.user
    current_user.unlike(walkcourse)
    flash[:success] = "お気に入りから削除しました"
    redirect_to user_path(user)
  end
end
