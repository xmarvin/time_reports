class Notifier < ActionMailer::Base
  default :from => "donotreply@timereports.heroku.com"

  def activation_instructions(user)
    @account_activation_url = activation_url(user.perishable_token)
    mail(:to => user.email, :subject => "Activation Instructions") do |format|
      format.html
		end
  end

  def activation_confirmation(user)
    mail(:to => user.email, :subject => "Activation Complete") do |format|
      format.html
		end
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
    @invite = invite
    mail(:to => invite.email, :subject => "You get invite") do |format|
      format.html
		end
  end
  
end
