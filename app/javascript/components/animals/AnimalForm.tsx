import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

const { Option } = Select;

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
  Select,
} from "antd"

const { Title, Paragraph } = Typography

const formTarget = document.getElementById("animal-form")

const FORM_ERRORS = window["signupFormErrors"]
window["signupFormErrors"] = undefined

const TextInput = ({ value, label, name }) => (
  <label>
    <input type="text" name={name} placeholder={label} value={value} />
  </label>
)

const AnimalForm = () => {
  const [formData, setFormData] = useState()
  const handleChange = (value) => (console.log(`selected ${value}`))

  useEffect(() => {
    fetch("/signup.json")
      .then((response) => response.json())
      .then((data) => setFormData({ ...data, errors: FORM_ERRORS }))
  }, [])

  return (
    <div>
      {formData && (
        <Row>
          <Col span={12} offset={6} >
            <Title>Add a Pet</Title>
            <Paragraph>
              This will allow you to create a profile for a pet needing a Foster home.
            </Paragraph>
          </Col>
          <Col span={12} offset={6}>
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
              <Divider>Basic Info</Divider>
              <Row>
                <Col span={12}>
                  <Form.Item
                    label="Pet Type"
                    name="animal_kind"
                    rules={[
                      {
                        required: true,
                        message: "Please select a pet type!"
                      }
                    ]}
                  >
                    <Select
                        style={{ width: 120 }}
                        onChange={handleChange}
                        placeholder="Please Select"
                    >
                      <Option value="dog">Dog</Option>
                      <Option value="cat">Cat</Option>
                    </Select>

                  </Form.Item>
                  <Form.Item
                    label="Pet Name"
                    name="name"
                    rules={[
                      {
                        required: true,
                        message: "Please input the pet name!"
                      }
                    ]}
                  >
                    <Input />
                  </Form.Item>
                  <Form.Item
                      name="sterilized"
                      label="Sterilized"
                  >
                    <Radio.Group>
                      <Radio value={true}>Yes</Radio>
                      <Radio value={false}>No</Radio>
                    </Radio.Group>
                  </Form.Item>
                </Col>
                <Col span={12}>
                  <Form.Item
                      name="gender"
                      label="Gender"
                  >
                    <Radio.Group>
                      <Radio value="male">Male</Radio>
                      <Radio value="female">Female</Radio>
                    </Radio.Group>
                  </Form.Item>
                  <Form.Item
                    label="Breed"
                    name="breed"
                    rules={[
                      {
                        required: true,
                        message: "Please input the pet's breed!"
                      }
                    ]}
                  >
                    <Input />
                  </Form.Item>

                  <Form.Item
                    label="Weight"
                    name="weight"
                    rules={[
                      {
                        required: true,
                        message: "Please input the pet's weight!"
                      }
                    ]}
                  >
                    <Input />
                  </Form.Item>

                  <Form.Item
                      name="microchiped"
                      label="Microchiped"
                  >
                    <Radio.Group>
                      <Radio value={true}>Yes</Radio>
                      <Radio value={false}>No</Radio>
                    </Radio.Group>
                  </Form.Item>
                </Col>
              </Row>
            </Form>
          </Col>
        </Row>
      )}
    </div>
  )
}

ReactDOM.render(<AnimalForm/>, formTarget)
