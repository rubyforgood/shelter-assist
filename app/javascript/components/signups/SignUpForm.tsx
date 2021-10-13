import React, { useState } from 'react'
import ReactDOM from 'react-dom'

import styles from './styles.module.css'

const formTarget = document.getElementById('signup-form')

const FORM_ERRORS = window['signupFormErrors']
window['signupFormErrors'] = undefined

function getForm() {
  return fetch('/signup.json')
    .then((response: any) => response.json())
}

const TextInput = ({value, label, name}) => (
  <label>
    <input type="text" name={name} placeholder={label} value={value} />
  </label>
)

const Radio = ({checked = false, value, label, name}) => (
  <label>
    {label}
    <input type="radio" value={value} name={name} />
  </label>
)

const Checkbox = ({checked = false, label, name, disabled = false, value = 1}: any) => (
  <label>
    {label}
    <input value={value} type="checkbox" name={name} disabled={disabled} />
  </label>
)

const SignIn = () => {
  const [formData, setFormData] = useState()

  if (!formData) {
    getForm()
      .then((data) => setFormData({...data, errors: FORM_ERRORS}))
  }

  return (
    <div>
      { formData && (
        <div>
          <h1>Sign In</h1>
          <form
              action={`${formData.path}`}
              acceptCharset="UTF-8"
              className={styles.form}
              method="post"
              >
                <input type="hidden" name="authenticity_token" value={formData.token} />
                <TextInput value={formData.full_name} name="person[full_name]" label="Full Name:" />
                <TextInput value={formData.nick_name} name="person[nick_name]" label="Nickname:" />
                <TextInput value={formData.email} name="person[email]" label="Email:" />
                <TextInput value={formData.street} name="person[street]" label="Street:" />
                <TextInput value={formData.apt} name="person[apt]" label="Apartment:" />
                <TextInput value={formData.phone} name="person[phone]" label="Phone Number:" />

                <h2>Home Information</h2>
                <p>Are you or another adult home during the day?</p>
                <fieldset>
                  <Radio value={true} label="Yes" name="person[is_home_during_day]" />
                  <Radio value={false} label="No" name="person[is_home_during_day]" />
                </fieldset>

                <h2>Tell us about your household</h2>
                <fieldset>
                  <Checkbox label="Fenced Yard" name="person[homes_attributes][0][has_fenced_yard]" />
                  <Checkbox label="Kids" name="person[homes_attributes][0][has_children]" />
                  <Checkbox label="Other Adults" name="person[homes_attributes][0][has_other_adults]" />
                  <Checkbox label="Dog(s)" name="person[homes_attributes][0][has_other_dog]" />
                  <Checkbox label="Cat(s)" name="person[homes_attributes][0][has_other_cat]" />
                </fieldset>

                <h2>Home Type</h2>
                <select name="person[homes_attributes][0][home_type]">
                  <option value="Apartment/Condo">Apartment/Condo</option>
                  <option value="Townhouse">Townhouse</option>
                  <option value="House">House</option>
                </select>

                <h2>Animal Kind</h2>
                <fieldset>
                  <Checkbox label="Dog" value="Dog" name="person[animal_kind_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="Cat" value="Cat" name="person[animal_kind_preferences_attributes][0][animal_value][]" disabled />
                </fieldset>

                <h2>Sex Preference</h2>
                <fieldset>
                  <Checkbox label="Male" value="Male" name="person[animal_gender_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="Female" value="Female" name="person[animal_gender_preferences_attributes][0][animal_value][]" />
                </fieldset>

                <h2>Age Preference</h2>
                <fieldset>
                  <Checkbox label="Puppy (up to 3 months)" value="Puppy (up to 3 months)" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="Young (3 months - 2 years)" value="Young (3 months - 2 years)" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="Adult (2 - 5 years)" value="Adult (2 - 5 years)" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="Senior (5 years + )" value="Senior (5 years + )" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                </fieldset>

                <h2>Size Preference</h2>
                <fieldset>
                  <Checkbox label="less than 20 lbs" value="less than 20 lbs" name="person[animal_size_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="20 - 40 lbs" value="20 - 40 lbs" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="40 - 60 lbs" value="40 - 60 lbs" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                  <Checkbox label="60 +" value="60 +" name="person[animal_age_preferences_attributes][0][animal_value][]" />
                </fieldset>

                <h2>Application</h2>
                <textarea name="person[animal_application][inspiration]"></textarea>

                <h2>Transportation</h2>
                <select name="person[transportation]">
                  <option value="access_to_car">Access to car</option>
                  <option value="car">Car</option>
                  <option value="no_car">No car</option>
                </select>
              <input type="submit" value="Fetch!" />
          </form>
        </div>
      )}
    </div>
  )
}

ReactDOM.render(<SignIn/>, formTarget)
