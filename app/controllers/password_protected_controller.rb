class PasswordProtectedController < DeviseController
  before_action :authenticate_foster!
  def current_foster
    @current_foster ||= PresentableFoster.build(resource, view_context)
  end
end
