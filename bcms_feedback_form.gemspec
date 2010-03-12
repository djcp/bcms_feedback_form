SPEC = Gem::Specification.new do |spec| 
  spec.name = "bcms_feedback_form"
  spec.rubyforge_project = spec.name
  spec.version = "1.0.0"
  spec.summary = "A Feedback Form Module for BrowserCMS"
  spec.author = "Daniel Collis-Puro" 
  spec.email = "djcp+github@cyber.law.harvard.edu" 
  spec.homepage = "http://www.browsercms.org" 
  spec.files += Dir["app/**/*"]
  spec.files += Dir["db/migrate/*.rb"]
  spec.files -= Dir["db/migrate/*_browsercms_*.rb"]
  spec.files -= Dir["db/migrate/*_load_seed_data.rb"]
  spec.files += Dir["lib/bcms_feedback_form.rb"]
  spec.files += Dir["lib/bcms_feedback_form/*"]
  spec.files += Dir["rails/init.rb"]
  spec.files += Dir["config/initializers/recaptcha.rb"]
  spec.files += Dir["public/bcms/feedback_form/**/*"]
  spec.has_rdoc = true
  spec.extra_rdoc_files = ["README"]
end
