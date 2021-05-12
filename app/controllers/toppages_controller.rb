class ToppagesController < ApplicationController
  def index
    @created_walkcourses = Walkcourse.all.order(created_at: :desc)
    @favorite_walkcourses = Walkcourse.joins(:favorites).group(:like_id).order('count(favorites.user_id) desc')
  end
end
