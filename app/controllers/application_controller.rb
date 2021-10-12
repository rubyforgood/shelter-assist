class ApplicationController < ActionController::Base
  def current_person
    @current_person ||= PresentablePerson.build(nil, view_context)
  end
  helper_method :current_person
end
