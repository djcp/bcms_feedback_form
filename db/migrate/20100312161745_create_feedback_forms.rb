class CreateFeedbackForms < ActiveRecord::Migration
  def self.up
    create_content_table :feedback_forms do |t|
      t.string :send_to, :limit => 500
      t.string :subject, :limit => 200
      t.string :from, :limit => 100
      t.string :form, :limit => 10000
      t.string :description, :limit => 5000
      t.string :thank_you, :limit => 5000
      t.boolean :use_recaptcha, :default => true
    end
    ContentType.create!(:name => "FeedbackForm", :group_name => "FeedbackForm")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'FeedbackForm'])
    CategoryType.all(:conditions => ['name = ?', 'Feedback Form']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :feedback_form_versions
    drop_table :feedback_forms
  end
end
