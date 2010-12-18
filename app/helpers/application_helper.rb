module ApplicationHelper
  def ej args
    escape_javascript args
  end

  def only_time(time)
    time ? time.strftime("%H:%M") : ''
  end

  def time_from_sec(sec)
    Time.at(sec).gmtime.strftime('%R')
  end

end
