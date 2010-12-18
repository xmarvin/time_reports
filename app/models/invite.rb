class Invite < ActiveRecord::Base
  belongs_to :project
  scope :for_email, lambda {|email| where(:email => email, :current_state => :unprocessed)}

 after_create :send_letter

 validates :email,   
           :presence => true,
           :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }  

   include AASM

  aasm_column :current_state

  aasm_state :unaccepted
  aasm_state :accepted, :enter => :accept_invite
  aasm_state :refused, :enter => :refuse_invite

  aasm_initial_state :unaccepted

  aasm_event :accept do
    transitions :to => :accepted, :from => :unaccepted
  end

  aasm_event :refuse do
    transitions :to => :refused, :from => :unaccepted
  end

  def send_letter
    Notifier.deliver_invite_was_sended(self)
  end

  def refuse_invite
  end

  def accept_invite
    self.project.users << User.find_by_email(email)
    self.project.save
  end

end
