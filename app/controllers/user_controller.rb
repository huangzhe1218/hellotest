# encoding: utf-8
class UserController < ApplicationController
  def login
    user = User.find_by_mac(params[:mac])
    if user
      cookies.permanent[:token] = user.token
      redirect_to :root
    else
      flash[:notice] = "登陆失败"
      redirect_to login_url
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to login_url

  end


end
