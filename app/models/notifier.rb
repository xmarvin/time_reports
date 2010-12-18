class Notifier < ActionMailer::Base
  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "noreply@time_reports.heroku.com"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activation_url(user.perishable_token)
    content_type "text/html"
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "noreply@time_reports.heroku.com"
    recipients    user.email
    sent_on       Time.now
    body          :user => user
    content_type "text/html"
  end

  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"  
    from          "noreply@time_reports"
    recipients    user.email  
    sent_on       Time.now
    body :user => user
    content_type "text/html"
  end

  def invite_was_sended(invite)  
    subject       "You get invite"  
    from          "noreply@time_reports.heroku.com"
    recipients    invite.email  
    sent_on       Time.now
    body :invite => invite
    content_type "text/html"
  end
  
end
