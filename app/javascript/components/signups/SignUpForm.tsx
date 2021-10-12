import React, { useState } from 'react'
import ReactDOM from 'react-dom'

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

const Checkbox = ({checked = false, label, name}) => (
  <label>
    {label}
    <input value={1} type="checkbox" name={name} />
  </label>
)

const SignIn = () => {
  const [formData, setFormData] = useState()

  if (!formData) {
    getForm()
      .then((data) => setFormData(data))
  }

  const handleOnSubmit = (t) => {
    return false
  }

  return (
    <div>
      { formData && (
        <div>
          <h1>Sign In</h1>
          <form
              action={`${formData.path}.json`}
              acceptCharset="UTF-8"
              method="post"
              onSubmitCapture={handleOnSubmit}
              >
                <input type="hidden" name="authenticity_token" value={formData.token} />
                <TextInput value={formData.full_name} name="foster[full_name]" label="Full Name:" />
                <TextInput value={formData.nick_name} name="foster[nick_name]" label="Nickname:" />
                <TextInput value={formData.email} name="foster[email]" label="Email:" />
                <TextInput value={formData.street} name="foster[street]" label="Street:" />
                <TextInput value={formData.apt} name="foster[apt]" label="Apartment:" />
                <TextInput value={formData.phone} name="foster[phone]" label="Phone Number:" />

                <h2>Home Information</h2>
                <p>Are you or another adult home during the day?</p>
                <fieldset>
                  <Radio value={true} label="Yes" name="foster[is_home_during_day]" />
                  <Radio value={false} label="No" name="foster[is_home_during_day]" />
                </fieldset>

                <h2>Tell us about your household</h2>
                <fieldset>
                  <Checkbox label="Fenced Yard" name="foster[homes][has_fenced_yard]" />
                  <Checkbox label="Kids" name="foster[homes][has_children]" />
                  <Checkbox label="Other Adults" name="foster[homes][has_other_adults]" />
                  <Checkbox label="Dog(s)" name="foster[homes][has_other_dog]" />
                  <Checkbox label="Cat(s)" name="foster[homes][has_other_cat]" />
                </fieldset>

                <h2>Application</h2>
                <textarea name="foster[animal_application][inspiration]"></textarea>

                <h2>Transportation</h2>
                <select name="foster[transportation]">
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

ReactDOM.render(<SignIn/>, document.getElementById('signup-form'))
