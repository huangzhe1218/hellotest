# encoding:utf-8
class User < ActiveRecord::Base

  attr_accessible :name, :mac, :weibo, :game, :menu, :group
  has_many  :courses 
  has_many  :messages

  before_create { generate_token(:token) }



  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def show_public
    courses.find_by_public(1)
  end

  def game_open
    update_attributes(:game=>true)
  end

  def game_close
    update_attributes(:game=>false)
  end

  def weibo_open
    update_attributes(:weibo=>true)
  end

  def weibo_close
    update_attributes(:weibo=>false)
  end

  def group_open
    update_attributes(:group=>true)
  end

  def group_close
    update_attributes(:group=>false)
  end

  def menu_open
    update_attributes(:menu=>true)
  end

  def menu_close
    update_attributes(:menu=>false)
  end

end

