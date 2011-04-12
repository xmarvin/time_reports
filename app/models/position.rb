class Position < ActiveRecord::Base
  has_many :profiles
  belongs_to :project
end
