module ApplicationHelper
  def standard_date(timestamp)
    timestamp.strftime("%d %b. %Y")
  end
end
