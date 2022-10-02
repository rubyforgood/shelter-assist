# frozen_string_literal: true

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @valid_parameters = {
      full_name: 'Chuck Norris',
      email: 'johndoe@mail.com',
      phone: '4017825678',
      is_home_during_day: true,
      transportation: :access_to_car,
      available_from: 5.days.from_now
    }
  end

  test 'inserts a valid person into the people table' do
    person = Person.new(@valid_parameters)

    assert person.valid?
  end

  test 'a person can be added with a phone number with special characters' do
    valid_parameters = @valid_parameters
    valid_parameters['phone'] = '401-782-5678'
    person = Person.new(valid_parameters)

    assert person.valid?
    assert_equal person.phone, '4017825678'
  end

  test 'a person can be rejected for bad entries' do
    bad_parameters = @valid_parameters
    bad_parameters['phone'] = '401-789-4567asdf'
    bad_person_1 = Person.new(bad_parameters)
    bad_parameters['phone'] = 'ruby for bad'
    bad_person_2 = Person.new(bad_parameters)

    assert bad_person_1.invalid?
    assert bad_person_2.invalid?
  end
end
