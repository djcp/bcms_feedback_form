require File.join(File.dirname(__FILE__), '/../../test_helper')

class FeedbackFormTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert FeedbackForm.create!
  end
  
end