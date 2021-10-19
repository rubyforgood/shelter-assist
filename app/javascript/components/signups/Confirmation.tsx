import React, { useState } from 'react'
import ReactDOM from 'react-dom'
import { Result } from 'antd';
import "antd/dist/antd.css";

import styles from './styles.module.css'

const formTarget = document.getElementById('confirmation-screen')

const Confirmation = () => {
  return (
    <div className={styles.checkboxIcon}>
      <Result
          status="success"
          title="Successfully Submitted"
          subTitle="A member of our team will get back to you as soon as possible. To sign in and edit your profile, tap the button in your email!"
      />
    </div>
  )
}

ReactDOM.render(<Confirmation/>, formTarget)
