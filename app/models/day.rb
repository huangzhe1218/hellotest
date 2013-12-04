class Day < ActiveRecord::Base
  attr_accessible :category, :cost, :id_category, :week_id
  belongs_to :week
end
