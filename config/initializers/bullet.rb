if defined? Bullet
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.rails_logger = true
  # Bullet.growl = true
  # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
  #                :password => 'bullets_password_for_jabber',
  #                :receiver => 'your_account@jabber.org',
  #                :show_online_status => true }
  # Bullet.console = true # js console
  # Bullet.alert = true
  # Bullet.honeybadger = true
  # Bullet.bugsnag = true
  # Bullet.airbrake = true
  # Bullet.rollbar = true
  # Bullet.add_footer = true
  # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  # Bullet.slack = { webhook_url: 'http://some.slack.url', foo: 'bar' }
end