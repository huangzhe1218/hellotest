# encoding: utf-8
class AboutController < ApplicationController
  def main
    if current_user
      @user = User.find_by_mac(current_user.mac) if current_user
      @courses = @user.courses
    else 
      redirect_to login_path
    end
  end
  def showdata
  end
  
  def checkapi
  end

  def message
  end
  
  def example
    app_key = Settings.pushkey.app_key
    master_secret = Settings.pushkey.master_secret
    time_to_live = 60 * 60 * 24
    jpush_client = JPushApiRubyClient::Client.new(app_key, master_secret, 'platform' => JPushApiRubyClient::PlatformType::ANDROID);
    send_no = jpush_client.generate_send_no
    msg_title = params[:title]
    msg_content = params[:msg]
    jpush_client.send_notification_with_appkey(send_no, msg_title, msg_content)
    redirect_to "/about/message", :notice=>"消息发送成功"
  end

end
