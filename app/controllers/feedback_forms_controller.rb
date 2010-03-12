class FeedbackFormsController < ApplicationController
  def submit
    feedback_form = FeedbackForm.find(params[:id])
    if feedback_form.use_recaptcha == true
      if verify_recaptcha
        Feedback.deliver_feedback(feedback_form, params)
      else
        raise
      end
    else
      Feedback.deliver_feedback(feedback_form, params)
    end
    if request.xhr?
      render :text => ((feedback_form.thank_you.blank?) ? 'Thanks!' : feedback_form.thank_you), :layout => false and return
    else
      redirect_to((params[:_redirect_to].blank?) ? '/' : params[:_redirect_to]) and return
    end
  rescue
    if request.xhr?
      render :text => 'There seems to have been an error. Please try again', :layout => false and return
    else
      redirect_to((params[:_redirect_to].blank?) ? '/' : params[:_redirect_to]) and return
    end
  end

end
