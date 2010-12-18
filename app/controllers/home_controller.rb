class HomeController < ApplicationController
  skip_before_filter :require_user

  def index
    collection
  end

  private
  
  def collection
    if current_user
      @projects = current_user.all_projects
      @invites = Invite.unaccepted.find_all_by_email(current_user.email)
    end
  end

end
