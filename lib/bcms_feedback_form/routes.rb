module Cms::Routes
  def routes_for_bcms_feedback_form
    self.connect 'feedback_forms/:action/:id.:format', :controller => 'feedback_forms'
    namespace(:cms) do |cms|
      cms.content_blocks :feedback_forms
    end  
  end
end
