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
  Row,
  Typography,
} from "antd"

const { Title, Paragraph } = Typography

import * as options from './fields'
import FormContext from "rc-field-form/es/FormContext"
import { formatMessages } from "esbuild"

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

  const homeOptions = [
    { label: "Apartment/Condo", value: "apt/condo" },
    { label: "House", value: "house" },
    { label: "Townhome", value: "townhome" }
  ];

  const options = [
    { label: 'Apple', value: '1', name: 'apple' },
    { label: 'Pear', value: '2', name: 'pear' },
    { label: 'Orange', value: '3', name: 'orange' },
  ];

  const onFinish = (values) => {
    const payload = {
      person: values
    }
    console.log("Success:", payload);
  }

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
              onFinish={onFinish}
              autoComplete="off"
            >
              <input
                type="hidden"
                name="authenticity_token"
                value={formData.token}
              />
              <Divider>Contact Info</Divider>
              <Row>
                <Col span={12}>
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
                </Col>
                <Col span={12}>
                  <Form.Item
                    label="Nickname"
                    name="nick_name"
                  >
                    <Input />
                  </Form.Item>
                </Col>
                </Row>
                <Row>
                  <Col span={12}>
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
                  </Col>
                  <Col span={12}>
                    <Form.Item
                      label="Phone Number"
                      name="phone_number"
                      rules={[
                    {
                      required: true,
                      message: "Please input your phone number!"
                    }
                    ]}
                    >
                  <Input />
              </Form.Item>
                </Col>
              </Row>
              
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

              <Divider>Home Information</Divider>
              <Paragraph>Are you or another adult home during the day?</Paragraph>

              <Form.Item name="transportation">
                <Radio.Group>
                <Radio
                  value={true}
                  label="Yes"
                  name="is_home_during_day"
                >Yes</Radio>
                <Radio
                  value={false}
                  label="No"
                  name="is_home_during_day"
                >No</Radio>
                </Radio.Group>
              </Form.Item>
              
              <Divider>Tell us about your household</Divider>
              {/* <Form.Item> */}
              {/* <Checkbox.Group> */}

              <Form.Item name='food'>
                <Checkbox.Group options={options} defaultValue={['Pear']}/>
              </Form.Item>

                <Form.Item name={['home_attributes', 'has_fenced_yard']}>
                  <Checkbox
                    label='Fenced Yard'
                    value={1}
                  >
                    Fenced Yard
                  </Checkbox>
                </Form.Item>
                <Form.Item name={['home_attributes', 'has_children']}>
                  <Checkbox
                    label='Kids'
                    value={1}
                  >
                    Kids
                  </Checkbox>
                </Form.Item>
                <Form.Item name={['home_attributes', 'has_other_adults']}>
                  <Checkbox
                    label='Other Adults'
                    value={1}
                  >
                    Other Adults
                  </Checkbox>
                </Form.Item>
                <Form.Item name={['home_attributes', 'has_other_dog']}>
                  <Checkbox
                    label='Dog(s)'
                    value={1}
                  >
                    Dog(s)
                  </Checkbox>
                </Form.Item>
                <Form.Item name={['home_attributes', 'has_other_cat']}>
                  <Checkbox
                    label='Cat(s)'
                    value={1}
                  >
                    Cat(s)
                  </Checkbox>
                </Form.Item>
              {/* </Checkbox.Group> */}
              {/* </Form.Item> */}

              <Divider>Home Type</Divider>
              <Form.Item name='home_type'>
              <select>
                <option value="Apartment/Condo">Apartment/Condo</option>
                <option value="Townhouse">Townhouse</option>
                <option value="House">House</option>
              </select>
              </Form.Item>
              
              <Divider>Animal Kind</Divider>
              <Form.Item name='animal_kind_preferences_attributes'>
              <Checkbox.Group>
                <Checkbox
                  label="Dog"
                  value="Dog"
                >
                  Dog
                </Checkbox>
                <Checkbox
                  label="Cat"
                  value="Cat"
                >
                  Cat
                </Checkbox>
              </Checkbox.Group>
              </Form.Item>

              <Divider>Sex Preference</Divider>
              <Form.Item name='animal_gender_preferences'>
              <Checkbox.Group>
              <Checkbox
                  label="Male"
                  value="Male"
                >
                  Male
                </Checkbox>
                <Checkbox
                  label="Female"
                  value="Female"
                >
                  Female
                </Checkbox> 
              </Checkbox.Group>
              </Form.Item>
              
              <Divider>Age Preference</Divider>
              <Form.Item name='animal_age_prefernces_attributes'>
              <Checkbox.Group>
              <Checkbox
                  label="Puppy (up to 3 months)"
                  value="Puppy (up to 3 months)"
              >
                Puppy (up to 3 months)
              </Checkbox>
              <Checkbox
                  label="Young (3 months - 2 years)"
                  value="Young (3 months - 2 years)"
                >
                  Young (3 months - 2 years)
                </Checkbox>
                <Checkbox
                  label="Adult (2 - 5 years)"
                  value="Adult (2 - 5 years)"
                >
                  Adult (2 - 5 years)
                </Checkbox>
                <Checkbox
                  label="Senior (5 years + )"
                  value="Senior (5 years + )"
                >
                  Senior (5 years +)
                </Checkbox>
              </Checkbox.Group>
              </Form.Item>
              
              <Divider>Size Preference</Divider>
              <Form.Item name='animal_size_preferences'>
              <Checkbox.Group>
                <Checkbox
                  label="less than 20 lbs"
                  value="less than 20 lbs"
                >
                  Less than 20 lbs
                </Checkbox>
                <Checkbox
                  label="20 - 40 lbs"
                  value="20 - 40 lbs"
                >
                  20 - 40 lbs
                </Checkbox>
                <Checkbox
                  label="40 - 60 lbs"
                  value="40 - 60 lbs"
                >
                  40 - 60 lbs
                </Checkbox>
                <Checkbox
                  label="60 +"
                  value="60 +"
                >
                  60 +
                </Checkbox>
              </Checkbox.Group>
              </Form.Item>
                  
              <Divider>Application</Divider>
              <Input.TextArea name="person[animal_application][inspiration]" rows={4} />
              <Divider>Transportation</Divider>
              <select name="transportation"
                rules={[
                  {
                    required: true,
                    message: "!"
                  }
                ]}
              >
                <option value="access_to_car">Access to car</option>
                <option value="car">Car</option>
                <option value="no_car">No car</option>
              </select>
              <input type="submit" value="Fetch!" />
              <Button type="primary" htmlType="submit">
                Submit
              </Button>
            </Form>
          </Col>
        </Row>
      )}
    </div>
  )
}

ReactDOM.render(<SignIn />, formTarget)
