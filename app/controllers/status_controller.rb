class StatusController < Passwordless::ApplicationController
  before_action :require_foster!
  def show
  end
end
