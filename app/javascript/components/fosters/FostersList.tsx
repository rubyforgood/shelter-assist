import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

import {
  Table,
  Space,
  Button,
  Col,
  Row,
  Typography,
  Select,
} from "antd"

const { Title, Paragraph } = Typography

const { Column, ColumnGroup } = Table;

const formTarget = document.getElementById("fosters-index")

function getPeople() {
  return fetch('/people.json')
    .then((response: any) => response.json())
}

const FostersList = () => {
  const [formData, setFormData] = useState()

  if (!formData) {
    getPeople()
      .then((data) => setFormData([...data]))
  }

  return (
    <Row>
      <Col span={20} offset={2}>
        { formData && (
          <div>
            <Row>
              <Col span={24}>
                <Title>Fosters</Title>
              </Col>
            </Row>
            <Table dataSource={formData}>
              <Column title="Name" dataIndex="full_name" key="full_name" />
              <Column title="Phone Number" dataIndex="phone" key="phone" />
              <Column title="Email" dataIndex="email" key="email"/>
              <Column
                title="Action"
                key="action"
                render={(text, record) => (
                  <Space size="middle">
                    <Button
                        href={`/people/${record.id}`}
                        type="link"
                    >
                      Edit
                    </Button>
                  </Space>
                )}
              />
            </Table>
            <Button
                href={"/people/new"}
                type="link"
            >
              New Foster
            </Button>
            <Button
                href={"/animals/new"}
                type="link"
            >
              Add Pet
            </Button>
          </div>
        )}
      </Col>
    </Row>
  )
}

ReactDOM.render(<FostersList/>, formTarget)
