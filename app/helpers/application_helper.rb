module ApplicationHelper
  
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end

  def full_title(page_title = '') 
    base_title = "pomopomo"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
