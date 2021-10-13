Passwordless.default_from_address = ENV["SHELTERASSIST_EMAIL_ADDRESS"] || "CHANGE_ME@example.com"
Passwordless.parent_mailer = "ActionMailer::Base"
Passwordless.token_generator = Passwordless::UrlSafeBase64Generator.new # Used to generate magic link tokens.
Passwordless.restrict_token_reuse = false # By default a magic link token can be used multiple times.
Passwordless.redirect_back_after_sign_in = true # When enabled the user will be redirected to their previous page, or a page specified by the `destination_path` query parameter, if available.

Passwordless.expires_at = lambda { 1.year.from_now } # How long until a passwordless session expires.
Passwordless.timeout_at = lambda { 1.hour.from_now } # How long until a magic link expires.

# Default redirection paths
Passwordless.success_redirect_path = '/status' # When a user succeeds in logging in.
Passwordless.failure_redirect_path = '/signup' # When a a login is failed for any reason.
Passwordless.sign_out_redirect_path = '/' # When a user logs out.
