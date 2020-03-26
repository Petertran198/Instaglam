require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhotoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    #This is to remove the default action_view_field_error_proc that adds a div with the class .field_with_errors 
    #Which messes up the styling of html because it adds an unnecessary div 
    #Below is the default: 
    # config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
    #   "<div class=\"field_with_errors control-group error\">#{html_tag}</div>".html_safe
    # }
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| 
      html_tag
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
