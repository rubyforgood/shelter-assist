require "test_helper"

class FosterTest < ActiveSupport::TestCase
  test 'valid foster' do
    foster = Foster.new(email: 'johndoe@mail.com', street: '123')
    assert foster.valid?
  end

  test 'does not add a foster with an empty street' do
    foster = Foster.new(email: 'johncena@mail.com', street: '')
    assert foster.invalid?
  end

  test 'does add a foster without apt' do
    foster = Foster.new(email: 'johnwick@mail.com', street: '987 street', apt: '')
    assert foster.valid?
  end

  test 'does add a foster with apt' do
    foster = Foster.new(email: 'johnwick@mail.com', street: '987 street', apt: '#123')
    assert foster.valid?
  end
end
