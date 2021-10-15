import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";

import axios from 'axios'

import {
  Button,
  Col,
  Form,
  Input,
  Divider,
  Checkbox,
  Radio,
  Row,
  Select,
  Typography,
} from "antd";

const { Option } = Select
const { Title, Paragraph } = Typography;

const formTarget = document.getElementById("signup-form");

const FORM_ERRORS = window["signupFormErrors"];
window["signupFormErrors"] = undefined;

const SignUp = () => {
  const [formData, setFormData] = useState();

  useEffect(() => {
    fetch("/signup.json")
      .then((response) => response.json())
      .then((data) => setFormData({ ...data, errors: FORM_ERRORS }));
  }, []);

  const homeOptions = [
    { label: "Apartment/Condo", value: 1 },
    { label: "House", value: 2 },
    { label: "Townhome", value: 3 },
  ];

  const sizeOptions = [
    { label: "less than 20 lbs", value: 1 },
    { label: "20 - 40 lbs", value: 2 },
    { label: "40 - 60 lbs", value: 3 },
    { label: "60lbs +", value: 4 },
  ];

  const ageOptions = [
    { label: "Puppy (up to 3 months)", value: 1 },
    { label: "Young (3 months - 2 years)", value: 2 },
    { label: "Adult (2 - 5 years)", value: 3 },
    { label: "Senior (5 years + )", value: 4 },
  ];

  const genderOptions = [
    { label: "Male", value: 1 },
    { label: "Female", value: 2 },
  ];

  const kindOptions = [
    { label: "Dog", value: 1 },
    { label: "Cat", value: 2 },
  ];

  const onFinish = (values) => {
    const home = {}, {
      homes_attributes,
      home_type,
      street,
      apt,
      city,
      state,
      zip,
    } = values

    homes_attributes.forEach((value) => {
      home[value] = 1
    })

    const addressAttributes = {street, apt, city, state, zip_code: zip},
          newHomeAttributes = {...home, ...addressAttributes, home_type}

    const payload = {
      authenticity_token: formData.token,
      person: {...values, homes_attributes: newHomeAttributes},
    }

    delete payload.person['home_type']
    delete payload.person['street']
    delete payload.person['apt']
    delete payload.person['city']
    delete payload.person['state']
    delete payload.person['zip']

    console.dir(payload)

    axios.post(`${formData.path}.json`, payload)
  };

  return (
    <div>
      {formData && (
        <Row>
          <Col span={12} offset={6}>
            <Title>Foster Application</Title>
            <Paragraph>
              Thank you for your interest in becoming a Foster! Please fill out
              the below application and someone from our team will be in touched
              as soon as possible. Once approved, you will be able to access
              your Foster Profile and be able to edit your informtion as you
              need.
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
                        message: "Please input your first name!",
                      },
                    ]}
                  >
                    <Input />
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item label="Nickname" name="nick_name">
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
                        message: "Please input your email!",
                      },
                    ]}
                  >
                    <Input />
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item
                    label="Phone Number"
                    name="phone"
                    rules={[
                      {
                        required: true,
                        message: "Please input your phone number!",
                      },
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
                    message: "Please input your street address!",
                  },
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item label="Apartment" name="apt">
                <Input />
              </Form.Item>

              <Form.Item
                label="City"
                name="city"
                rules={[
                  {
                    required: true,
                    message: "Please input your city!",
                  },
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
                    message: "Please input your state!",
                  },
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
                    message: "Please input your zip code!",
                  },
                ]}
              >
                <Input />
              </Form.Item>

              <Divider>Home Information</Divider>
              <Paragraph>
                Are you or another adult home during the day?
              </Paragraph>

              <Form.Item name="is_home_during_day">
                <Radio.Group options={[{label: "Yes", value: "1"}, {label: "No", value: "0"}]} />
              </Form.Item>

              <Divider>Tell us about your household</Divider>
              <Form.Item name="homes_attributes">
                <Checkbox.Group>
                  <Checkbox value="has_fenced_yard">
                    Fenced Yard
                  </Checkbox>
                  <Checkbox value="has_children">
                    Kids
                  </Checkbox>
                  <Checkbox value="has_other_adults">
                    Other Adults
                  </Checkbox>
                  <Checkbox value="has_other_dog">
                    Dog(s)
                  </Checkbox>
                  <Checkbox value="has_other_cat">
                    Cat(s)
                  </Checkbox>
                </Checkbox.Group>
              </Form.Item>

              <Divider>Home Type</Divider>
              <Form.Item name="home_type">
                <Select options={homeOptions} />
              </Form.Item>

              <Divider>Animal Kind</Divider>
              <Form.Item name="animal_kind_preferences_attributes">
                <Checkbox.Group options={kindOptions} />
              </Form.Item>

              <Divider>Gender Preference</Divider>
              <Form.Item name="animal_gender_preferences_attributes">
                <Checkbox.Group options={genderOptions} />
              </Form.Item>

              <Divider>Age Preference</Divider>
              <Form.Item name="animal_age_preferences_attributes">
                <Checkbox.Group options={ageOptions} />
              </Form.Item>

              <Divider>Size Preference</Divider>
              <Form.Item name="animal_size_preferences_attributes">
                <Checkbox.Group options={sizeOptions} />
              </Form.Item>

              <Divider>Transportation</Divider>
              <Form.Item name="transportation">
                <Select>
                  <Option value="access_to_car">Access to car</Option>
                  <Option value="car">Car</Option>
                  <Option value="no_car">No car</Option>
                </Select>
              </Form.Item>

              <Divider>Application</Divider>

              {/* <Form.Item name="inspiration">
                <Input.TextArea rows={4} />
              </Form.Item> */}

              <Button type="primary" htmlType="submit">
                Submit
              </Button>
            </Form>
          </Col>
        </Row>
      )}
    </div>
  );
};

ReactDOM.render(<SignUp />, formTarget);
