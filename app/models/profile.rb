class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  belongs_to :project

  def name
  user.name
  end
end
