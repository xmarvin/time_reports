class Interval < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :by_user, lambda {|user| where(:user_id => user.id)}

  validates_presence_of :date, :start, :finish, :note
  validate :time_valid?

  def time_valid?
    if (finish && start && finish <= start)
      errors.add("finish", "Finish must be after start")
    end
  end

  def delta
    finish - start
  end

  def self.total_time(intervals)
    intervals.map {|i| i.delta }.sum()
  end

end
