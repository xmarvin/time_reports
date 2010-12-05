class User < ActiveRecord::Base
  acts_as_authentic

  has_many :roles
  has_and_belongs_to_many :projects
  has_many :own_projects, :class_name => 'Project', :foreign_key => "owner_id"
  has_many :intervals
  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.send_later(:deliver_password_reset_instructions, self)  
  end  


  def deliver_invitation_instructions!
    reset_perishable_token!
    Notifier.send_later(:deliver_invitation_instructions, self)
  end

  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.send_later(:deliver_activation_instructions, self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    Notifier.send_later(:deliver_activation_confirmation, self)
  end

  def activate_and_deliver_confirmation
    activate! and deliver_activation_confirmation!
  end
  
end
