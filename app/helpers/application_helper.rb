module ApplicationHelper
  def form_auth
    "<input type='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'>".html_safe
  end

  def title_helper(page_name)
    "Apple Cinnamon | #{page_name}"
  end
end
