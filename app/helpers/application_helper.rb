module ApplicationHelper
  def app_name
    "Find me vids"
  end

  def active_li(*controllers)
    active_class = controllers.include?(params[:controller]) ? 'active' : ''
    content_tag(:li, class: active_class) do
      yield
    end
  end
end
