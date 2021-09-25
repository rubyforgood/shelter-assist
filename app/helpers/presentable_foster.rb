require 'delegate'
class PresentableFoster < DelegateClass(Foster)
  alias foster __getobj__
  def initialize(foster, view)
    super(foster)
    @view = view
  end

  def name
    foster.nick_name.presence || foster.full_name
  end

  def logged_in?
    !foster.nil?
  end
end
