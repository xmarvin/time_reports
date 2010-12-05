class InvitesController < ApplicationController
  inherit_resources
  belongs_to :project, :optional => true
  respond_to :html, :js

  create! do |s, f|
    f.js { render :errors}
  end

  def accept
    resource.accept
    resource.save
  end

  def refuse
    resource.refuse
    resource.save
  end

end
