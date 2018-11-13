Devise.setup do |config|
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"
  require "devise/orm/active_record"
  config.secret_key = '382d5ba49254baa728f2f39a302fb7429169e83dec25a7eb07c5a66250ed30db823742fb8c6bb3be12153fe7ee08d31d412ac8b86d683cec8c2483207d29dbef'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
end
