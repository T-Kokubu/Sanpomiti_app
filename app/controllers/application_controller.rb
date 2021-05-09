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
end
