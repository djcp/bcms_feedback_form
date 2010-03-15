class FeedbackSubmission < ActiveRecord::Base
  belongs_to :feedback_form

  validates_length_of :feedback_content, :maximum => 256.kilobytes, :allow_blank => true
  validates_length_of :user_agent, :maximum => 1000, :allow_blank => true
  validates_length_of :ip_address, :maximum => 20, :allow_blank => true

end
