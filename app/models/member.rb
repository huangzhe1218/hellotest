class Member < ActiveRecord::Base
  has_secure_password
  attr_accessible :phonenum, :name, :password, :password_confirmation, :token
  before_create { generate_token(:token) }


  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :phonenum, :presence => true, :uniqueness => {:case_sensitive => false}, :phone_format => true
  validates :password, :length => { :minimum => 6 }, :on => :create

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
