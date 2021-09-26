class ApplicationController < ActionController::Base
  def current_foster
    @current_foster ||= PresentableFoster.build(nil, view_context)
  end
  helper_method :current_foster
end
