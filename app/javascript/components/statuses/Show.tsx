import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

const pageTarget = document.getElementById("foster-profile")

const Show = () => {
  const [personData, setPersonData] = useState({})

  const readableBoolean = (val: boolean) => {
    return val ? "Yes" : "No"
  }

  useEffect(() => {
    fetch("/status.json")
      .then((response) => response.json())
      .then((data) => setPersonData({ ...data }))
  }, [])

  return(
    <div>
      { personData.person && (
        <>
          <h1>{personData.person.nick_name ? personData.person.nick_name : personData.person.full_name}</h1>
          <p>Email: {personData.person.email}</p>
          <p>Phone: {personData.person.phone}</p>
          <p>Is home during the day: {readableBoolean(personData.person.is_home_during_day)}</p>
          <h1>Homes:</h1>
          { personData.homes.map((home: any) => (
            <>
              <p>{home.street}</p>
              <p>{home.apt}</p>
              <p>{`${home.city}, ${home.state} ${home.zip_code}`}</p>
              <p>Home type: {home.home_type}</p>
              <p>Has children: {readableBoolean(home.has_children)}</p>
              <p>Has fenced yard: {readableBoolean(home.has_fenced_yard)}</p>
              <p>Has other adult(s): {readableBoolean(home.has_other_adults)}</p>
              <p>Has other dog(s): {readableBoolean(home.has_other_dog)}</p>
              <p>Has other cat(s): {readableBoolean(home.has_other_cat)}</p>
            </>
          ))}
          <h1>Animal Kind Preferences</h1>
          { personData.animal_kind_preferences.map((animal_kind: any) => (
            <p>{animal_kind.animal_value}</p>
          ))}
          <h1>Animal Gender Preferences</h1>
          { personData.animal_gender_preferences.map((animal_gender: any) => (
            <p>{animal_gender.animal_value}</p>
          ))}
          <h1>Animal Size Preferences</h1>
          { personData.animal_size_preferences.map((animal_size: any) => (
            <p>{animal_size.animal_value}</p>
          ))}
          <h1>Animal Age Preferences</h1>
          { personData.animal_age_preferences.map((animal_age: any) => (
            <p>{animal_age.animal_value}</p>
          ))}
        </>
      )}
    </div>
  )
}

ReactDOM.render(<Show/>, pageTarget)
