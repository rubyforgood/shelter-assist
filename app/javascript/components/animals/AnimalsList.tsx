import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

import {
  Table,
  Space,
  Button,
  Col,
  Row,
  Typography,
} from "antd"

const { Title, Paragraph } = Typography

const { Column } = Table;

const formTarget = document.getElementById("animals-index")

function getAnimals() {
  return fetch('/animals.json')
    .then((response: any) => response.json())
}

const AnimalsList = () => {
  const [formData, setFormData] = useState()

  if (!formData) {
    getAnimals()
      .then((data) => setFormData([...data]))
  }
  console.log(formData)
  return (
    <Row>
      <Col span={20} offset={2}>
        { formData && (
          <div>
            <Row style={{ marginBottom: 16, marginTop: 16 }}>
              <Col span={24}>
                <Button
                    type="default"
                    size='large'
                    href={"/people"}
                >
                  Fosters
                </Button>
                <Button
                    type="primary"
                    size='large'
                    href={"/animals"}
                >
                  Pets
                </Button>
              </Col>
            </Row>
            <Table dataSource={formData}>
              <Column title="Name" dataIndex="name" key="name" />
              <Column title="Pet Type" dataIndex="animal_kind" key="animal_kind" />
              <Column title="Breed" dataIndex="breed" key="breed"/>
              <Column title="Birthdate" dataIndex="birthdate" key="birthdate"/>
              <Column title="Gender" dataIndex="gender" key="gender"/>
              <Column title="Weight" dataIndex="weight" key="weight"/>
            </Table>
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

ReactDOM.render(<AnimalsList/>, formTarget)
