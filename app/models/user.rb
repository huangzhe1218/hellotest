# encoding:utf-8
class User < ActiveRecord::Base

  attr_accessible :name, :mac
  has_many  :courses

  before_create { generate_token(:token) }



  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
