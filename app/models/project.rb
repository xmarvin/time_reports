class Project < ActiveRecord::Base

  
  has_many :profiles
  #has_and_belongs_to_many :users
  has_many :intervals
  has_many :invites
  validates_presence_of :name, :description
  validates_uniqueness_of :name

  def user_profile(user)
     Profile.where(:project_id => self, :user_id => user.id).first
  end
  def owners
    self.profiles.find_by_owner(true)
  end
end
