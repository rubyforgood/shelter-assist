module PasswordlessTestHelper
  def sign_in(resource, scope: nil)
    session = Passwordless::Session.new({
      authenticatable: resource,
      user_agent: 'Integration Test',
      remote_addr: 'unknown',
    })
    session.save!
  end
end
