MediatainmentProductionsTemplate::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb
  config.action_controller.default_url_options = {host: 'localhost', port: 3000}

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.smtp_settings = {
      from: ENV['MAIL_SENDER_EMAIL_ADDRESS'],
      address: ENV['MAIL_SENDER_SERVER_HOST'],
      authentication: :login,
      enable_starttls_auto: ENV['MAIL_SENDER_TLS'],
      user_name: ENV['MAIL_SENDER_USERNAME'],
      password: ENV['MAIL_SENDER_PASSWORD'],
      openssl_verify_mode: 'none'}

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true
end
