#encoding: utf-8
class MembersController < ApplicationController
  def signup
    @member = Member.new 
    render :layout => 'login'
  end

  def login
    render :layout => 'login'
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      cookies.permanent[:token] = @member.token
      params = {}
      params["gw_id"]="huangzhe"
      params["gw_address"]="192.168.42.1"
      params["gw_port"]="2060"
      params["authenticator"]="apAuthSplashOnly"
      params["submit[apAuthSplashOnlyConnect"]="Connect"
      uri = URI.parse("http://auth.smbiztalk.cn/authpuppy/web/ws/?action=auth&authenticator=apAuthSplashOnly")  
      res1 = Net::HTTP.post_form(uri, params)   
      res2 = JSON.parse(res1.body)['values']['redirect']
      redirect_to res2
    else
      render :signup, :layout => "login"
    end
  end
  
  def create_login_session
    member = Member.find_by_name(params[:name])
    if member && member.authenticate(params[:password])
      cookies.permanent[:token] = member.token
      params = {}
      params["gw_id"]="huangzhe"
      params["gw_address"]="192.168.42.1"
      params["gw_port"]="2060"
      params["authenticator"]="apDefaultAuthenticator"
      params["submit[apAuthLocalUserconnect]"]="Connect"
      params["apAuthLocalUser[username]"]="joel"
      params["apAuthLocalUser[password]"]="12345678" 
      uri = URI.parse("http://auth.smbiztalk.cn/authpuppy/web/ws/?action=auth&authenticator=apAuthLocalUser")  
      res1 = Net::HTTP.post_form(uri, params)   
      res2 = JSON.parse(res1.body)['values']['redirect']
      redirect_to res2
    else
      flash[:error] = "无效的用户名和密码"
      redirect_to mlogin_url
    end
  end

  def logout
    cookies.delete(:token)
    redirect_to root_url, :notice => "已经退出登录"
  end
end
