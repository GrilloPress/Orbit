module ApplicationHelper
  
  def is_page_active(page)
    
    if request.path == page
      return "active"
    end
    
  end
  
end