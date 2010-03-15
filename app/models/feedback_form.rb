class FeedbackForm < ActiveRecord::Base
  acts_as_content_block
  has_many :feedback_submissions

  validates_length_of :send_to, :maximum => 500
  validates_length_of :subject, :maximum => 200, :allow_blank => true
  validates_length_of :from, :maximum => 100, :allow_blank => true
  validates_length_of :form, :maximum => 10000, :allow_blank => true
  validates_length_of :description, :thank_you, :maximum => 5000, :allow_blank => true
  validates_format_of :from, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true
end
