class PasswordlessMailerPreview < ActionMailer::Preview
  def magic_link
    Passwordless::Mailer.magic_link(
      Passwordless::Session.new(
        token: '1234',
        authenticatable: Foster.new
      )
    )
  end
end
