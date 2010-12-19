class User < ActiveRecord::Base
  acts_as_authentic

  has_many :intervals
  has_and_belongs_to_many :projects
  has_many :own_projects, :class_name => 'Project', :foreign_key => "owner_id"

  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

  def all_projects
    (own_projects + projects).uniq
  end
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    #Notifier.send_later(:deliver_password_reset_instructions, self)  
    Notifier.deliver_password_reset_instructions(self)
  end  


  def deliver_invitation_instructions!
    reset_perishable_token!
    Notifier.send_later(:deliver_invitation_instructions, self)
  end

  def deliver_activation_instructions!
    reset_perishable_token!
   # Notifier.send_later(:deliver_activation_instructions, self)
    Notifier.activation_instructions(self).deliver
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    #Notifier.send_later(:deliver_activation_confirmation, self)
    Notifier.deliver_activation_confirmation(self)
  end

  def activate_and_deliver_confirmation
    activate! and deliver_activation_confirmation!
  end
  
end
