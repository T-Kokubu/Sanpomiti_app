class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    walkcourse = Walkcourse.find(params[:like_id])
    current_user.like(walkcourse)
    flash[:success] = 'お気に入りに追加しました'
    redirect_to walkcourse_path(walkcourse)
  end

  def destroy
    walkcourse = Walkcourse.find(params[:like_id])
    current_user.unlike(walkcourse)
    flash[:success] = 'お気に入りから削除しました'
    redirect_to walkcourse_path(walkcourse)
  end
end
