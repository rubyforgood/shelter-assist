import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

import {
  Button,
  Col,
  Form,
  Input,
  Divider,
  Checkbox,
  Radio,
  Cascader,
  DatePicker,
  Row,
  Typography,
} from "antd"

const { Title, Paragraph } = Typography

import * as options from './fields'

const formTarget = document.getElementById("signup-form")

const FORM_ERRORS = window["signupFormErrors"]
window["signupFormErrors"] = undefined

const TextInput = ({ value, label, name }) => (
  <label>
    <input type="text" name={name} placeholder={label} value={value} />
  </label>
)

const SignIn = () => {
  const [formData, setFormData] = useState()

  useEffect(() => {
    fetch("/signup.json")
      .then((response) => response.json())
      .then((data) => setFormData({ ...data, errors: FORM_ERRORS }))
  }, [])

  return (
    <div>
      {formData && (
        <Row>
          <Col span={12} offset={6}>
            <Title>Foster Application</Title>
            <Paragraph>
              Thank you for your interest in becoming a Foster! Please fill out the
              below application and someone from our team will be in touched as soon
              as possible. Once approved, you will be able to access your Foster
              Profile and be able to edit your informtion as you need.
            </Paragraph>
            <Form
              name="person"
              labelCol={{ span: 6 }}
              wrapperCol={{ span: 10 }}
              initialValues={{ remember: true }}
              // onFinish={onFinish}
              autoComplete="off"
            >
              <input
                type="hidden"
                name="authenticity_token"
                value={formData.token}
              />
              <Divider>Contact Info</Divider>
              <Form.Item
                label="Name"
                name="full_name"
                rules={[
                  {
                    required: true,
                    message: "Please input your first name!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Nickname"
                name="nick_name"
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Email"
                name="email"
                rules={[
                  {
                    required: true,
                    message: "Please input your email!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Divider>Address</Divider>
              <Form.Item
                label="Street"
                name="street"
                rules={[
                  {
                    required: true,
                    message: "Please input your street address!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Apartment"
                name="apt"
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Phone Number"
                name="apt"
                rules={[
                  {
                    required: true,
                    message: "Please input your phone number!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="City"
                name="city"
                rules={[
                  {
                    required: true,
                    message: "Please input your city!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="State"
                name="state"
                rules={[
                  {
                    required: true,
                    message: "Please input your state!"
                  }
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Zip"
                name="zip"
                rules={[
                  {
                    required: true,
                    message: "Please input your zip code!"
                  }
                ]}
              >
                <Input />
              </Form.Item>

              <Title level={2}>Home Information</Title>
              <Paragraph>Are you or another adult home during the day?</Paragraph>

              <Form.Item name="transportation">
                <Radio.Group>
                  <Radio value={true}>Yes</Radio>
                  <Radio value={false}>No</Radio>
                </Radio.Group>
              </Form.Item>
              {/* <fieldset>
                <Radio
                  value={true}
                  label="Yes"
                  name="person[is_home_during_day]"
                />
                <Radio
                  value={false}
                  label="No"
                  name="person[is_home_during_day]"
                />
              </fieldset>

              <h2>Tell us about your household</h2>
              <fieldset>
                <Checkbox
                  label="Fenced Yard"
                  name="person[homes_attributes][0][has_fenced_yard]"
                />
                <Checkbox
                  label="Kids"
                  name="person[homes_attributes][0][has_children]"
                />
                <Checkbox
                  label="Other Adults"
                  name="person[homes_attributes][0][has_other_adults]"
                />
                <Checkbox
                  label="Dog(s)"
                  name="person[homes_attributes][0][has_other_dog]"
                />
                <Checkbox
                  label="Cat(s)"
                  name="person[homes_attributes][0][has_other_cat]"
                />
              </fieldset>

              <h2>Home Type</h2>
              <select name="person[homes_attributes][0][home_type]">
                <option value="Apartment/Condo">Apartment/Condo</option>
                <option value="Townhouse">Townhouse</option>
                <option value="House">House</option>
              </select>

              <h2>Animal Kind</h2>
              <fieldset>
                <Checkbox
                  label="Dog"
                  value="Dog"
                  name="person[animal_kind_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="Cat"
                  value="Cat"
                  name="person[animal_kind_preferences_attributes][0][animal_value][]"
                  disabled
                />
              </fieldset>

              <h2>Sex Preference</h2>
              <fieldset>
                <Checkbox
                  label="Male"
                  value="Male"
                  name="person[animal_gender_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="Female"
                  value="Female"
                  name="person[animal_gender_preferences_attributes][0][animal_value][]"
                />
              </fieldset>

              <h2>Age Preference</h2>
              <fieldset>
                <Checkbox
                  label="Puppy (up to 3 months)"
                  value="Puppy (up to 3 months)"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="Young (3 months - 2 years)"
                  value="Young (3 months - 2 years)"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="Adult (2 - 5 years)"
                  value="Adult (2 - 5 years)"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="Senior (5 years + )"
                  value="Senior (5 years + )"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
              </fieldset>

              <h2>Size Preference</h2>
              <fieldset>
                <Checkbox
                  label="less than 20 lbs"
                  value="less than 20 lbs"
                  name="person[animal_size_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="20 - 40 lbs"
                  value="20 - 40 lbs"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="40 - 60 lbs"
                  value="40 - 60 lbs"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
                <Checkbox
                  label="60 +"
                  value="60 +"
                  name="person[animal_age_preferences_attributes][0][animal_value][]"
                />
              </fieldset>

              <h2>Application</h2>
              <textarea name="person[animal_application][inspiration]"></textarea>

              <h2>Transportation</h2>
              <select name="person[transportation]">
                <option value="access_to_car">Access to car</option>
                <option value="car">Car</option>
                <option value="no_car">No car</option>
              </select>
              <input type="submit" value="Fetch!" /> */}
            </Form>
          </Col>
        </Row>
      )}
    </div>
  )
}

ReactDOM.render(<SignIn />, formTarget)
