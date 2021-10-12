class PasswordlessController < Passwordless::ApplicationController
  include Passwordless::ControllerHelpers
  helper_method :current_person

  private

  def current_person
    @current_person ||= PresentablePerson.build(authenticate_by_session(Person), view_context)
  end

  def require_person!
    return if current_person
    redirect_to root_path, flash: { error: 'Go to your crate!' }
  end
end
