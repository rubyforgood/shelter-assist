import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";
import axios from "axios";

import {
  Alert,
  Button,
  Col,
  Form,
  Input,
  Divider,
  Checkbox,
  Radio,
  Row,
  Select,
  Space,
  Typography,
} from "antd";

const { Option } = Select;
const { Title, Paragraph } = Typography;

import {
  homeOptions,
  sizeOptions,
  ageOptions,
  genderOptions,
  kindOptions,
} from "./fields";

const formTarget = document.getElementById("signup-form");

const SignUp = () => {
  const [formData, setFormData] = useState();
  const [showErrorMessage, setShowErrorMessage] = useState();
  const [errorMessage, setErrorMessage] = useState(
    "Failed to create foster signup!"
  );
  const [errorDescription, setErrorDescription] = useState(
    "Please check the form and try again!"
  );

  useEffect(() => {
    axios
      .get("/signup.json")
      .then(({ data }) => {
        setFormData(data);
      })
      .catch(() =>
        console.error("Could not retrieve form data from the server.")
      );
  }, []);

  const onFinish = (values) => {
    let age,
      gender,
      kind,
      size,
      home = {},
      {
        animal_age_preferences_attributes,
        animal_gender_preferences_attributes,
        animal_kind_preferences_attributes,
        animal_size_preferences_attributes,
        homes_attributes,
        home_type,
        street,
        apt,
        city,
        state,
        zip,
      } = values;

    homes_attributes?.forEach((value) => {
      home[value] = 1;
    });

    if (animal_age_preferences_attributes?.length) age = [];
    animal_age_preferences_attributes?.forEach((value, i) => {
      age[i] = { animal_value: value };
    });

    if (animal_gender_preferences_attributes?.length) gender = [];
    animal_gender_preferences_attributes?.forEach((value, i) => {
      gender[i] = { animal_value: value };
    });

    if (animal_kind_preferences_attributes?.length) kind = [];
    animal_kind_preferences_attributes?.forEach((value, i) => {
      kind[i] = { animal_value: value };
    });

    if (animal_size_preferences_attributes?.length) size = [];
    animal_size_preferences_attributes?.forEach((value, i) => {
      size[i] = { animal_value: value };
    });

    const addressAttributes = { street, apt, city, state, zip_code: zip },
      newHomeAttributes = { ...home, ...addressAttributes, home_type };

    const payload = {
      authenticity_token: formData.token,
      person: {
        ...values,
        homes_attributes: [newHomeAttributes],
        animal_age_preferences_attributes: age,
        animal_gender_preferences_attributes: gender,
        animal_kind_preferences_attributes: kind,
        animal_size_preferences_attributes: size,
      },
    };

    delete payload.person["home_type"];
    delete payload.person["street"];
    delete payload.person["apt"];
    delete payload.person["city"];
    delete payload.person["state"];
    delete payload.person["zip"];

    axios
      .post(`${formData.path}.json`, payload)
      .then(({ data, status }: any) => {
        if (status === 201) window.location.href = data.path;
      })
      .catch(({ response }) => {
        const { data } = response;
        setErrorDescription(data.errors.join("\n"));
        setShowErrorMessage(true);
      });
  };

  return (
    <div>
      {formData && (
        <Row>
          <Col span={12} offset={6}>
            <Title>Foster Application</Title>
            {showErrorMessage && (
              <Alert
                className="mb-2"
                message={errorMessage}
                description={errorDescription}
                type="error"
                closable
                onClose={() => setShowErrorMessage(false)}
              />
            )}
            <Space direction="horizontal" size="large" align="center">
              <Paragraph>
                {`Thank you for your interest in becoming a Foster! Please fill out
                the below application and someone from our team will be in touched
                as soon as possible. Once approved, you will be able to access
                your Foster Profile and be able to edit your informtion as you
                need.`}
              </Paragraph>
            </Space>
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

              <Divider>{`Home Information`}</Divider>
              <Paragraph>
                {`Are you or another adult home during the day?`}
              </Paragraph>

              <Form.Item
                name="is_home_during_day"
                rules={[
                  {
                    required: true,
                    message: "Are you home during the day?",
                  },
                ]}
              >
                <Radio.Group
                  options={[
                    { label: "Yes", value: "1" },
                    { label: "No", value: "0" },
                  ]}
                />
              </Form.Item>

              <Divider>{`Tell us about your household`}</Divider>
              <Form.Item name="homes_attributes">
                <Checkbox.Group>
                  <Checkbox value="has_fenced_yard">{`Fenced Yard`}</Checkbox>
                  <Checkbox value="has_children">{`Kids`}</Checkbox>
                  <Checkbox value="has_other_adults">{`Other Adults`}</Checkbox>
                  <Checkbox value="has_other_dog">{`Dog(s)`}</Checkbox>
                  <Checkbox value="has_other_cat">{`Cat(s)`}</Checkbox>
                </Checkbox.Group>
              </Form.Item>

              <Divider>{`Home Type`}</Divider>
              <Form.Item
                name="home_type"
                rules={[
                  {
                    required: true,
                    message: "Home type cannot be blank!",
                  },
                ]}
              >
                <Select options={homeOptions} />
              </Form.Item>

              <Divider>{`Animal Kind`}</Divider>
              <Form.Item name="animal_kind_preferences_attributes">
                <Checkbox.Group options={kindOptions} />
              </Form.Item>

              <Divider>{`Gender Preference`}</Divider>
              <Form.Item name="animal_gender_preferences_attributes">
                <Checkbox.Group options={genderOptions} />
              </Form.Item>

              <Divider>{`Age Preference`}</Divider>
              <Form.Item name="animal_age_preferences_attributes">
                <Checkbox.Group options={ageOptions} />
              </Form.Item>

              <Divider>{`Size Preference`}</Divider>
              <Form.Item name="animal_size_preferences_attributes">
                <Checkbox.Group options={sizeOptions} />
              </Form.Item>

              <Divider>{`Transportation`}</Divider>
              <Form.Item
                name="transportation"
                rules={[
                  {
                    required: true,
                    message: "Do you have reliable transportation?",
                  },
                ]}
              >
                <Select>
                  <Option value="access_to_car">{`Access to car`}</Option>
                  <Option value="car">{`Car`}</Option>
                  <Option value="no_car">{`No car`}</Option>
                </Select>
              </Form.Item>

              <Divider>{`Application`}</Divider>

              <Space align="top" direction="vertical">
                <Button type="primary" htmlType="submit">
                  {`Submit`}
                </Button>
              </Space>
              <br />
              <br />
              <br />
            </Form>
          </Col>
        </Row>
      )}
    </div>
  );
};

ReactDOM.render(<SignUp />, formTarget);
