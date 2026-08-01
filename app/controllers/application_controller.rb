class ApplicationController < ActionController::Base
  include Authentication

  private

  def after_authentication_url
    post_images_path
  end

  def after_logout_url
    about_path
  end
end