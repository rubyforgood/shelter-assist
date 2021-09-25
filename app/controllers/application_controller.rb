class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_foster

  private

  def current_foster
    @current_foster ||= PresentableFoster.new(authenticate_by_session(Foster), view_context)
  end

  def require_foster!
    return if current_foster
    redirect_to root_path, flash: { error: 'Go to your crate!' }
  end
end
