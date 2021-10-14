import React, { useState } from 'react'
import ReactDOM from 'react-dom'

import styles from './styles.module.css'

const formTarget = document.getElementById('animal-form')

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

const AnimalForm = () => {
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


                <h2>Home Type</h2>
                <select name="person[homes_attributes][0][home_type]">
                  <option value="Apartment/Condo">Apartment/Condo</option>
                  <option value="Townhouse">Townhouse</option>
                  <option value="House">House</option>
                </select>


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

ReactDOM.render(<AnimalForm/>, formTarget)
