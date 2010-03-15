module Cms::Routes
  def routes_for_bcms_feedback_form
    self.connect 'feedback_forms/:action/:id.:format', :controller => 'feedback_forms'
    namespace(:cms) do |cms|
      cms.connect 'feedback_forms/download/:id',:controller => 'feedback_forms', :action => :download, :conditions => {:method => :get}
      cms.content_blocks :feedback_forms
    end  
  end
end
