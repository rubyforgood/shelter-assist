class PasswordProtectedController < DeviseController
  before_action :authenticate_person!

  def current_person
    @current_person ||= warden.authenticate(scope: :person)
  end
end