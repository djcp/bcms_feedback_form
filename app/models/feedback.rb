class Feedback < ActionMailer::Base

  def feedback(feedback_form,params)
    recipients feedback_form.send_to.split(',')
    from       (feedback_form.from.blank?) ? params[:from] : feedback_form.from
    subject    (feedback_form.subject.blank?) ? 'Feedback form submission' : feedback_form.subject
    body       :feedback_form => feedback_form, :cgi_params => params, :fields => params[:feedback_form].keys
  end

end
