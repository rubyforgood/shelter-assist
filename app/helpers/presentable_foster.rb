require 'delegate'
class PresentableFoster < DelegateClass(Foster)
  def self.build(foster, view)
    case foster
    when nil
      Visitor
    else
      self
    end.new(foster, view)
  end

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

  class Visitor < self
    def name; end
  end
end
