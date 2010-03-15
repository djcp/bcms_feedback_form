class Cms::FeedbackFormsController < Cms::ContentBlockController

  def download
    @feedback_form = FeedbackForm.find(params[:id])
    render_csv(@feedback_form.feedback_submissions)
  end

  def render_csv(objects)
    columns = {}
    rows = []

    # Iterate through to find all the possible columns, just in case multiple versions of a form have been submitted.
    objects.each do |obj|
      row = YAML.load(obj.feedback_content)
      rows << row
      row['user_agent'] = obj.user_agent
      row['ip_address'] = obj.ip_address
      row.keys.each do |column|
        columns[column] = 1
      end
    end

    csv_output = ''
    sorted_columns = columns.keys.sort
    CSV::Writer.generate(csv_output) do |csv|
      csv << sorted_columns
      rows.each do |row|
        row_array = []
        sorted_columns.each do |col|
          row_array << row[col] || ''
        end
        csv << row_array
      end
    end
    send_data(csv_output,
              :type => 'application/octet-stream',
              :filename => "feedback-submissions-#{Time.now.to_s(:number)}.csv")
  end

end
