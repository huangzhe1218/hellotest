# encoding: utf-8
class PortalController < ApplicationController
  def show
    render :layout => false
  end

  
  def hotapp
    render :layout => 'portal'
  end
  
  def hotmenu
    render :layout => false
  end
  
  def portal
    @user = User.find_by_mac(params[:member_mac])
    unless @user
      redirect_to portal_other_url
    else
      render :layout => false
    end
  end
  
  def rank
    render :layout => false
  end

  def main
    @user = User.find_by_mac(params[:member_mac])
    unless @user
      redirect_to portal_other_url
    else
      @course = @user.show_public
      unless @course
        redirect_to portal_other_url
      else
        render :layout => 'portal'
      end
    end
  end 

end
