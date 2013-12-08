class Course < ActiveRecord::Base
  attr_accessible :description, :name, :title, :poster, :user_id, :public
  validates_presence_of :title

  belongs_to :user

  mount_uploader :poster, PosterUploader


end
