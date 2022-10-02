# frozen_string_literal: true

require 'delegate'
class PresentablePerson < DelegateClass(Person)
  def self.build(person, view)
    case person
    when nil
      Visitor
    else
      self
    end.new(person, view)
  end

  alias person __getobj__
  def initialize(person, _view)
    super(person)
  end

  def name
    person.nick_name.presence || person.full_name
  end

  def logged_in?
    !person.nil?
  end

  class Visitor < self
    def name; end

    def admin?
      false
    end
  end
end
