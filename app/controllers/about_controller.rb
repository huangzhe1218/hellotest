class AboutController < ApplicationController
  def main
    if current_user
      @user = User.find_by_mac(current_user.mac) if current_user
      @courses = @user.courses
    else 
      redirect_to login_path
    end
  end

end
