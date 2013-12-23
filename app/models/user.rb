# encoding:utf-8
class User < ActiveRecord::Base

  attr_accessible :name, :mac, :weibo, :game
  has_many  :courses

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
end
