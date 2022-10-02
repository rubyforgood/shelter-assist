# frozen_string_literal: true

module PasswordlessTestHelper
  def sign_in(resource, _scope)
    session = Passwordless::Session.new({
                                          authenticatable: resource,
                                          user_agent: 'Integration Test',
                                          remote_addr: 'unknown'
                                        })
    session.save!
  end
end
