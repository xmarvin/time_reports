class IntervalsController < ApplicationController
  inherit_resources
  belongs_to :project
  before_filter :build_resource, :only => [:index, :date, :total]
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

  private
  
  def find_date
    date_param = params[:interval] ? params[:interval][:date] : params[:date] || ''
    @date =  Time.parse(date_param).to_date
  end

  def collection
    find_date

    @intervals = @project.intervals.by_user(current_user).find_all_by_date(@date)
    @total_time = Interval.total_time(@intervals)
  end

  def set_user
    resource.user = current_user
    resource.save
  end

end
