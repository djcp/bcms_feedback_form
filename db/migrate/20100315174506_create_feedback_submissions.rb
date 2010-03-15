class CreateFeedbackSubmissions < ActiveRecord::Migration
  def self.up
    create_table :feedback_submissions do |t|
      t.references :feedback_form
      t.string :feedback_content, :limit => 256.kilobytes
      t.string :user_agent, :limit => 1000
      t.string :ip_address, :limit => 20
      t.timestamps
    end
    add_index :feedback_submissions, :feedback_form_id
    add_index :feedback_submissions, :user_agent
    add_index :feedback_submissions, :ip_address
  end

  def self.down
    drop_table :feedback_submissions
  end
end
