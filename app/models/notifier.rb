class Notifier < ActionMailer::Base
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "TimeReports"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activation_url(user.perishable_token)
    content_type "text/html"
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "OnlineStore@bonobotown.com"  
    recipients    user.email
    sent_on       Time.now
    body          :user => user
    content_type "text/html"
  end

  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "OnlineStore@bonobotown.com"  
    recipients    user.email  
    sent_on       Time.now
    body :user => user
    content_type "text/html"
  end
  
end
