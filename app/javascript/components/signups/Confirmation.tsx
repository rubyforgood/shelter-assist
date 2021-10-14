import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import { Button } from 'antd';
import "antd/dist/antd.css";

import styles from './styles.module.css'

const formTarget = document.getElementById('confirmation-screen')

const Confirmation = () => {
  return (
    <Button type="primary">Button</Button>
  )
}

ReactDOM.render(<Confirmation/>, formTarget)
