class Notifier < ActionMailer::Base
  default :from => "TimeReports"

  def new_file
    mail(:to => "Spy-A@yandex.ru", :subject => "New File") do |format|
      format.text {
        render :text => "Hello"
      }
    end
  end

  def activation_instructions(user)
    @account_activation_url = activation_url(user.perishable_token)
    mail(:to => user.email, :subject => "Activation Instructions") do |format|
      format.html
		end  
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
    from          "TimeReports"
    recipients    invite.email  
    sent_on       Time.now
    body :invite => invite
    content_type "text/html"
  end
  
end
