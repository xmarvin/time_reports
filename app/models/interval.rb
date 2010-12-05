class Interval < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

 scope :search_by_date, lambda {|date|where(:date => date) }

end
