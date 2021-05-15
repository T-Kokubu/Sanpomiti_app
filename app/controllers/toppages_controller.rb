class ToppagesController < ApplicationController
  def index
    @created_walkcourses = Walkcourse.all.order(created_at: :asc).page(params[:page]).per(6)
    @favorite_walkcourses = Walkcourse.joins(:favorites).group('walkcourses.id', :like_id).order('count(favorites.user_id) desc').page(params[:page]).per(6)
  end
end
