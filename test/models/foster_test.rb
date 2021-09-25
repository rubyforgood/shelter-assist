require "test_helper"

class FosterTest < ActiveSupport::TestCase
  def setup
    @valid_parameters = {
      full_name: 'Chuck Norris',
      email: 'johndoe@mail.com',
      phone: '4017824567',
      street: '123 Coconut Ave',
      is_home_during_day: true
    }
  end

  test 'inserts a valid foster into the fosters table' do
    foster = Foster.new(@valid_parameters)

    assert foster.valid?
  end

  test 'a foster can be rejected for an empty street' do
    bad_parameters = @valid_parameters
    bad_parameters['street'] = ''
    foster = Foster.new(bad_parameters)

    assert foster.invalid?
  end

  test 'does add a foster without apt' do
    valid_parameters = @valid_parameters
    valid_parameters['apt'] = ''
    foster = Foster.new(valid_parameters)

    assert foster.valid?
  end

  test 'does add a foster with an apt' do
    valid_parameters = @valid_parameters
    valid_parameters['apt'] = 'Suite #789'
    foster = Foster.new(valid_parameters)

    assert foster.valid?
  end

  test 'a foster can be added with a phone number with special characters' do
    valid_parameters = @valid_parameters
    valid_parameters['phone'] = '401-782-5678'
    foster = Foster.new(valid_parameters)

    assert foster.valid?
    assert_equal foster.phone, '4017825678'
  end

  test "a foster can be rejected for bad entries" do
    bad_parameters = @valid_parameters
    bad_parameters['phone'] = '1234567890'
    bad_foster_1 = Foster.new(bad_parameters)
    bad_parameters['phone'] = '401-789-4567asdf'
    bad_foster_2 = Foster.new(bad_parameters)
    bad_parameters['phone'] = 'ruby for bad'
    bad_foster_3 = Foster.new(bad_parameters)

    assert bad_foster_1.invalid?
    assert bad_foster_2.invalid?
    assert bad_foster_3.invalid?
  end
end
