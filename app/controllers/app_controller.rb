# encoding: utf-8
class AppController < ApplicationController

  def app_on
    user = current_user
    respond_to do |format|
      format.js do
        if params[:app_name] == 'weibo'
          user.weibo_open
        elsif params[:app_name] =='game'
          user.game_open
        end
      end
    end
  end
  
  def app_off
    user = current_user
    respond_to do |format|
      format.js do
        if params[:app_name] == 'weibo'
          user.weibo_close
        elsif params[:app_name] =='game'
          user.game_close
        end
      end
    end
  end

end
