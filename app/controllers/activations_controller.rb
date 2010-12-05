class ActivationsController < ApplicationController
  skip_before_filter :require_user
  before_filter :require_no_user, :only => [:new, :create]

  def new
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)
    if (@user&&!@user.active?)
      if @user.activate_and_deliver_confirmation
        flash[:notice] = "Your account has been activated"
        redirect_to root_url
      end
    else
      render :text => "<h1>Activation error!!</h1>"
    end
  end
end
