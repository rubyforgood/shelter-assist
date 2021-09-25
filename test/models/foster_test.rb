require "test_helper"

class FosterTest < ActiveSupport::TestCase
  test 'valid foster' do
    foster = Foster.new(email: 'johndoe@mail.com', phone: '4017824567', street: '123')
    assert foster.valid?
  end

  test 'does not add a foster with an empty street' do
    foster = Foster.new(email: 'johncena@mail.com', phone: '4017824567', street: '')
    assert foster.invalid?
  end

  test 'does add a foster without apt' do
    foster = Foster.new(email: 'johnwick@mail.com', phone: '4017824567', street: '987 street', apt: '')
    assert foster.valid?
  end

  test 'does add a foster with apt' do
    foster = Foster.new(email: 'johnwick@mail.com', phone: '4017824567', street: '987 street', apt: '#123')
    assert foster.valid?
  end
  
  test "a foster can be added with valid entries" do
    foster = Foster.create(email: 'chuck.norris@jetli.com', phone: '4017824567', street: '123')

    assert foster.valid?
  end

  test "a foster can be rejected for bad entries" do
    bad_foster_1 = Foster.create(email: 'chuck.norris@jetli.com', phone: '1234567890', street: '123')
    bad_foster_2 = Foster.create(email: 'chuck.norris@jetli.com', phone: '401-782-4567', street: '123')
    bad_foster_3 = Foster.create(email: 'chuck.norris@jetli.com', phone: '4017824567asdf', street: '123')
    bad_foster_4 = Foster.create(email: 'chuck.norris@jetli.com', phone: 'ruby for bad', street: '123')

    assert bad_foster_1.invalid?
    assert bad_foster_2.invalid?
    assert bad_foster_3.invalid?
    assert bad_foster_4.invalid?
  end
end
