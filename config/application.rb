require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Webapp
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      
      
      g.view_specs false
      g.helper_specs false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    #
    # SMTP / basic email setup
    #
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { :host => Figaro.env.webapp_default_url }

    # basic SMTP setup
    config.action_mailer.smtp_settings = {
      address: Figaro.env.smtp_address,
      port: Figaro.env.smtp_port,
      domain: Figaro.env.webapp_domain,
      authentication: Figaro.env.smtp_authentication,
      user_name: Figaro.env.smtp_user_name,
      password: Figaro.env.smtp_password,
      enable_starttls_auto: true
    }

    # basic email settings
    config.action_mailer.default_options = {
      from: Figaro.env.smtp_default_from_address,
      reply_to: Figaro.env.smtp_default_reply_to_address
    }

    # raise an error when something goes wrong with emails
    config.action_mailer.raise_delivery_errors = true

    # Send email in development mode.
    config.action_mailer.perform_deliveries = true


    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
