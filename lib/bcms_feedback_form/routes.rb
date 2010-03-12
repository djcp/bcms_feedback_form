module Cms::Routes
  def routes_for_bcms_feedback_form
    namespace(:cms) do |cms|
      #cms.content_blocks :feedback_forms
    end  
  end
end
