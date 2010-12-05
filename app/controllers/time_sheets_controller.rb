class TimeSheetsController < ApplicationController
  inherit_resources
  defaults :resource_class => 'Interval', :collection_name => 'intervals', :instance_name => 'interval'
  belongs_to :project
  before_filter :set_date, :only => :index
  before_filter :build_resource, :only => :index


  def date
  end

  def collection
    @intervals = @project.intervals.search_by_date(@date)
  end

  def set_date
    @date = Time.now.to_date
  end

end
