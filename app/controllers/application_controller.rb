class ApplicationController < ActionController::Base
  def current_person
    @current_person ||= PresentablePerson.build(nil, view_context)
  end

  def json_form(model, path, errors = [])
    {
      errors: errors,
      foster: model,
      path: path,
      token: form_authenticity_token
    }
  end
  helper_method :json_form
  helper_method :current_person
end
