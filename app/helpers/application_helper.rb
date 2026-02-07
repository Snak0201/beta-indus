module ApplicationHelper
  def page_title(title)
    if title.present?
      "#{title} | βインディの星明かり"
    else
      "βインディの星明かり"
    end
  end
end
