class ProjectsController < ApplicationController
  inherit_resources
  respond_to :html, :js
  before_filter :build_resource, :only => :index
  before_filter :create_invite, :only => :show



  def create
    @project = Project.create(params[:project])
    profile =  Profile.new(:user => current_user)
    @project.users << profile
    @project.owner = profile
    create! do |s, f|
      f.js { render :errors}
    end
  end

  private

  def create_invite
    @invite = Invite.new
  end

  def collection
    @projects = current_user.all_projects if current_user
  end
end
