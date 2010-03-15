# Feedback form module for BrowserCMS > 3.1.0

Provides a feedback form content block protected by Recaptcha. It also:

* Allows you to specific the thank you message,
* Gives you the ability to create a custom form,
* Requires that you register at recaptcha.net and create an API key,
* Uses prototype to dynamically swap out the form in-place with a thank you message, allowing this to work fine in a statically cached environment,
* Includes the recaptcha plugin,
* Gives you a CSV download for form submissions (as of 1.0.2).

## Installation

1. Create a recaptcha.net account and set up a public/private API key.
2. Follow the generic module instructions here: http://guides.browsercms.org/installing_modules.html
3. Edit BROWSER_CMS_ROOT/config/initializer/recaptcha.rb to include your API keys. Restart your rails app.
4. Ensure your application is able to deliver outgoing email.
5. Ensure that your page template includes the prototype libraries - this relies on form_remote_for() to handle form submissions.
6. Test!

## Uninstallation

1. Remove this entry from config/routes.rb

    map.routes_for_bcms_feedback_form

2. Remove the "config.gem" line that refers to this plugin from config/environment.

3. Remove config/initializers/recaptcha.rb

4. Remove vendor/plugins/recaptcha

5. Remove the database

    rake db:migrate:down VERSION=20100312161745_create_feedback_forms

6. Remove db/migration/20100312161745_create_feedback_forms.rb

## Author

Dan Collis-Puro
djcp@cyber.law.harvard.edu

## License

LGPL
