class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"
  has_many :intervals
  has_many :invites
  validates_presence_of :name, :description
  validates_uniqueness_of :name

end
