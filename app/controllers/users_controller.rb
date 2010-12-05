class UsersController < InheritedResources::Base
  
  before_filter :require_no_user, :only => [:new, :create, :guest]
  before_filter :require_user, :only => [:show, :edit, :update, :shares]
  before_filter :assign_user, :only => [:show, :edit, :update]

  def new
    @user = build_resource
  end

  def create
    @user = build_resource
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_back_or_default login_url
    else
      render :action => :new
    end

  end

  def update
    @user.update_attributes(params[:user]) do |result|
      if result
        unless @user.active?
          @user.deliver_activation_instructions!
          flash[:notice] = "You have changed email. Please check your e-mail for your account reactivation instructions!"
          redirect_to signout_path
        else
          flash[:notice] = "Account updated!"
          redirect_to @user
        end
      else
        render :action => :edit
      end
    end
  end

  private

  def assign_user
    @user = current_user    
  end

end
