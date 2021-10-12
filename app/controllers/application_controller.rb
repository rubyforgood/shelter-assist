class ApplicationController < ActionController::Base
  def current_foster
    @current_foster ||= PresentableFoster.build(nil, view_context)
  end

  def json_form(model, path, errors = [])
    {
      errors: errors,
      foster: model,
      path: path,
      token: form_authenticity_token
    }
  end
  helper_method :current_foster
  helper_method :json_form
end
