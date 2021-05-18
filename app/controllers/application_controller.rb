class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_user_logged_in
    redirect_to login_url unless logged_in?
  end

  def counts(user)
    @count_walkcourses = user.walkcourses.count
    @count_favorites = user.likes.count
  end

  def set_search
    @search = Walkcourse.ransack(params[:q])
    @walkcourses = @search.result.distinct.page(params[:page]).per(6)
  end
end
