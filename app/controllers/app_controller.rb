# encoding: utf-8
class AppController < ApplicationController
  
  def app_on
    user = User.find_by_mac(params[:member_mac])
    respond_to do |format|
      format.js do
        if params[:app_name] == 'weibo'
          user.weibo_open
        elsif params[:app_name] =='game'
          user.game_open
        elsif params[:app_name] =='group'
          user.group_open
        elsif params[:app_name] =='menu'
          user.menu_open
        end
      end
    end
  end
  
  def app_off
    user = User.find_by_mac(params[:member_mac])
    respond_to do |format|
      format.js do
        if params[:app_name] == 'weibo'
          user.weibo_close
        elsif params[:app_name] =='game'
          user.game_close
        elsif params[:app_name] =='group'
          user.group_close
        elsif params[:app_name] =='menu'
          user.menu_close
        end
      end
    end
  end

  def freeland
    params = {}
    params["gw_id"]="huangzhe"
    params["gw_address"]="192.168.1.1"
    params["gw_port"]="2060"
    params["authenticator"]="apDefaultAuthenticator"
    params["submit[apAuthLocalUserconnect]"]="Connect"
    params["apAuthLocalUser[username]"]="joel"
    params["apAuthLocalUser[password]"]="12345678" 
    uri = URI.parse("http://auth.smbiztalk.cn/authpuppy/web/ws/?action=auth&authenticator=apAuthLocalUser")  
    res1 = Net::HTTP.post_form(uri, params)   
    @res = JSON.parse(res1.body)['values']['redirect']
    render :layout => false;    
  end
  def wificon
    param1={}
    param1["gw_id"]="huangzhe"
    param1["gw_address"]="192.168.1.1"
    param1["gw_port"]="2060"
    param1["authenticator"]="apDefaultAuthenticator"
    param1["submit[apAuthLocalUserconnect]"]="Connect"
    param1["apAuthLocalUser[username]"]=params[:username]
    param1["apAuthLocalUser[password]"]="12345678"
    uri = URI.parse("http://auth.smbiztalk.cn/authpuppy/web/ws/?action=auth&authenticator=apAuthLocalUser")  
    res1 = Net::HTTP.post_form(uri, param1)   
    @res = JSON.parse(res1.body)['values']['redirect']
    render :layout => false;    
  end
end
