class InfoController < ApplicationController
  layout 'styleguide_css', :only => [:styleguide]

  def marketing
    @user = User.new
    session[:return_to] = request.url
  end

  def set_locale
    cookies.permanent[:locale] = params[:locale]
    redirect_to_target_or_default :root
  end
end

