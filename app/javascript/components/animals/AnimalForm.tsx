import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

import axios from 'axios'

import {
  Button,
  Col,
  Form,
  Input,
  Divider,
  Radio,
  Row,
  Typography,
  Select,
  DatePicker
} from "antd"

const { Title, Paragraph } = Typography

const { Option } = Select;

const formTarget = document.getElementById("animal-form")



const AnimalForm = () => {
  const [formData, setFormData] = useState()

  useEffect(() => {
    fetch("/animals/new.json")
      .then((response) => response.json())
      .then((data) => setFormData({...data}));
  }, []);

  const onFinish = (values) => {

    const payload = {
      authenticity_token: formData.token,
      animal: values,
    }

    axios.post("/animals.json", payload).then((result: any) => window.location.href = result.data.path)
  };

  return (
    <div>
      {formData && (
        <Row>
          <Col span={12} offset={6}>
          <Row>
            <Col span={24} align="center">
              <Title>Add a Pet</Title>
              <Paragraph>
                This will allow you to create a profile for a pet needing a Foster home.
              </Paragraph>
            </Col>
          </Row>
            <Col span={16} offset={4}>
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
                    label="Birthdate"
                    name="birthdate"
                    rules={[
                      {
                        required: true,
                        message: "Please input the pet's birthdate!"
                      }
                    ]}
                  >
                    <DatePicker />
                  </Form.Item>
                  <div>
                  <Form.Item
                      name="sterilized"
                      label="Sterilized"
                  >
                    <Radio.Group>
                      <Radio value={true}>Yes</Radio>
                      <Radio value={false}>No</Radio>
                    </Radio.Group>
                  </Form.Item>
                  </div>
                </Col>
                <Col span={12}>
                  <Form.Item
                      name="gender"
                      label="Gender"
                      rules={[
                        {
                          required: true,
                          message: "Please select a pet type!"
                        }
                      ]}
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
                      name="microchipped"
                      label="Microchipped"
                  >
                    <Radio.Group>
                      <Radio value={true}>Yes</Radio>
                      <Radio value={false}>No</Radio>
                    </Radio.Group>
                  </Form.Item>
                </Col>
              </Row>
              <Form.Item wrapperCol={{ offset: 8, span: 16 }}>
                <Button type="primary" htmlType="submit">
                  Add Pet
                </Button>
              </Form.Item>
            </Form>
            </Col>
          </Col>
        </Row>
      )}
    </div>
  )
}

ReactDOM.render(<AnimalForm/>, formTarget)
