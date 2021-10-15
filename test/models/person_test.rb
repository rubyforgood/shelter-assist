require "test_helper"

class PersonTest < ActiveSupport::TestCase
  def setup
    @valid_parameters = {
      full_name: 'Chuck Norris',
      email: 'johndoe@mail.com',
      phone: '4017824567',
      street: '123 Coconut Ave',
      is_home_during_day: true,
      transportation: :access_to_car,
    }
  end

  test 'inserts a valid person into the people table' do
    person = Person.new(@valid_parameters)

    assert person.valid?
  end

  test 'does add a person without apt' do
    valid_parameters = @valid_parameters
    valid_parameters['apt'] = ''
    person = Person.new(valid_parameters)

    assert person.valid?
  end

  test 'does add a person with an apt' do
    valid_parameters = @valid_parameters
    valid_parameters['apt'] = 'Suite #789'
    person = Person.new(valid_parameters)

    assert person.valid?
  end

  test 'a person can be added with a phone number with special characters' do
    valid_parameters = @valid_parameters
    valid_parameters['phone'] = '401-782-5678'
    person = Person.new(valid_parameters)

    assert person.valid?
    assert_equal person.phone, '4017825678'
  end

  test "a person can be rejected for bad entries" do
    bad_parameters = @valid_parameters
    bad_parameters['phone'] = '401-789-4567asdf'
    bad_person_1 = Person.new(bad_parameters)
    bad_parameters['phone'] = 'ruby for bad'
    bad_person_2 = Person.new(bad_parameters)

    assert bad_person_1.invalid?
    assert bad_person_2.invalid?
  end
end
