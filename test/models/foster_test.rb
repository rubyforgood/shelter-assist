require "test_helper"

class FosterTest < ActiveSupport::TestCase
  test 'valid foster' do
    foster = Foster.new(email: 'johndoe@mail.com', street: '123')
    assert foster.valid?
  end

  test 'invalid without street' do
    foster = Foster.new(email: 'johncena@mail.com', street: '')
    assert foster.invalid?
  end

  test 'valid without apt' do
    foster = Foster.new(email: 'johnwick@mail.com', street: '987 street', apt: '')
    assert foster.valid?
  end
end
