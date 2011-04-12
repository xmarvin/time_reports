class IntervalsController < ApplicationController
  inherit_resources
  belongs_to :project
  before_filter :build_resource, :only => [:index, :date, :total, :report]
  before_filter :collection, :only => [:index, :date, :total]
  before_filter :find_date, :only => [:create, :update]
  after_filter :set_user, :only => :create
  respond_to :html, :js

  create! do |s, f|
    f.js { render :errors}
  end

  def total
  end

  def date
   # collection
  end

  def timer
  end

  def report
    @users = @project.profiles
    m = Date.current.month
    y = Date.current.year
    if params[:first_date]

    else

    end
    @first_date =   (params[:first_date] ? Time.parse(params[:first_date]) : Date.new(y,m,1)).to_date 
    @last_date =  (params[:last_date] ? Time.parse(params[:last_date] ) : Date.new(y,m,-1)).to_date
    puts "*"*100
    if params[:user_id]
      @user = Profile.find(params[:user_id])
      puts @user.id
      @intervals = @project.intervals.by_user(@user).find :all,  :conditions => ['date >= ? AND date <= ?', @first_date, @last_date]
      @total_time = Interval.total_time(@intervals)
    end
  end
  private
  
  def find_date
    date_param = params[:interval] ? params[:interval][:date] : params[:date] || ''
    @date =  Time.parse(date_param).to_date
    date_param =  params[:interval][:last_date] if params[:interval] && params[:interval][:last_date]
    @last_date =  Time.parse(date_param).to_date
  end

  def collection
    find_date
    @intervals = @project.intervals.by_user(current_user).find_all_by_date(@date)
    @total_time = Interval.total_time(@intervals)
  end

  def set_user
    resource.profile = @project.user_profile(current_user)
    resource.save
  end

end
