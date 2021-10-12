require "test_helper"

class HomeTest < ActiveSupport::TestCase
  test 'valid home has person_id' do
    attrs = create_home_attributes({ has_fenced_yard: true })
    home = Home.new(attrs)

    assert home.valid?
    assert home.has_fenced_yard == true
  end

  test 'defaults all attrs to false' do
    home = Home.new()
    assert home.valid?
  end

  def create_home_attributes(opts = {})
    {
      has_children: opts[:has_children] || false,
      has_fenced_yard: opts[:has_fenced_yard] || false,
      has_other_adults: opts[:has_other_adults] || false,
      has_other_dog: opts[:has_other_dog] || false,
      has_other_cat: opts[:has_other_cat] || false,
    }
  end
end
