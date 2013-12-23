# encoding: utf-8
class WeiboController < ApplicationController

  WeiboOAuth2::Config.api_key = "1967533109"
  WeiboOAuth2::Config.api_secret = "c158f2b1a30836615b34d756eb86d941"
  WeiboOAuth2::Config.redirect_uri = "http://wifi.smbiztalk.cn/callback"
  
  def connect 
    client = WeiboOAuth2::Client.new
    redirect_to client.authorize_url
  end

  def callback 
    client = WeiboOAuth2::Client.new
    access_token = client.auth_code.get_token(params[:code].to_s)
    session[:uid] = access_token.params["uid"]
    session[:access_token] = access_token.token
    session[:expires_at] = access_token.expires_at
    p "*" * 80 + "callback"
    p access_token.inspect
    @user = client.users.show_by_uid(session[:uid].to_i)
    redirect_to '/test'
  end
end
