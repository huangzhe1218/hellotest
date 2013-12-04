class Week < ActiveRecord::Base
  attr_accessible :category, :cost, :id_category
  has_many :days
end
