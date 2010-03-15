class FeedbackFormsController < ApplicationController
  def submit
    feedback_form = FeedbackForm.find(params[:id])

    if (feedback_form.use_recaptcha == false) || verify_recaptcha
      begin
        FeedbackSubmission.create(
          :feedback_form => feedback_form, 
          :feedback_content => params[:feedback_form].to_yaml, 
          :user_agent => request.user_agent,
          :ip_address => request.remote_ip
        )
      rescue Exception => e
        #Failed, but it's not a huge deal.
      end
      Feedback.deliver_feedback(feedback_form, params)
    else
      raise
    end

    if request.xhr?
      render :text => ((feedback_form.thank_you.blank?) ? 'Thanks!' : feedback_form.thank_you), :layout => false and return
    else
      redirect_to((params[:_redirect_to].blank?) ? '/' : params[:_redirect_to]) and return
    end
  rescue Exception => e
    if request.xhr?
      render :text => 'There seems to have been an error. Please try again', :layout => false and return
    else
      redirect_to((params[:_redirect_to].blank?) ? '/' : params[:_redirect_to]) and return
    end
  end

end
