class PasswordProtectedController < DeviseController
  before_action :authenticate_person!
  def current_person
    @current_person ||= PresentablePerson.build(resource, view_context)
  end
end
