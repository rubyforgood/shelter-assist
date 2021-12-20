import React, { useEffect, useState } from "react"
import ReactDOM from "react-dom"

const pageTarget = document.getElementById("person-profile")

const PersonProfile = () => {
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
            <div key={`home-${home.id}`}>
              <p key={`street-${home.id}`}>{home.street}</p>
              <p key={`apt-${home.id}`}>{home.apt}</p>
              <p key={`csz-${home.id}`}>{`${home.city}, ${home.state} ${home.zip_code}`}</p>
              <p key={`type-${home.id}`}>Home type: {home.home_type}</p>
              <p key={`children-${home.id}`}>Has children: {readableBoolean(home.has_children)}</p>
              <p key={`fence-${home.id}`}>Has fenced yard: {readableBoolean(home.has_fenced_yard)}</p>
              <p key={`adults-${home.id}`}>Has other adult(s): {readableBoolean(home.has_other_adults)}</p>
              <p key={`dog-${home.id}`}>Has other dog(s): {readableBoolean(home.has_other_dog)}</p>
              <p key={`cat-${home.id}`}>Has other cat(s): {readableBoolean(home.has_other_cat)}</p>
            </div>
          ))}
          <h1>Animal Kind Preferences</h1>
          { personData.animal_kind_preferences.map((animal_kind: any) => (
            <p key={`animal-kind-${animal_kind.id}`}>{animal_kind.animal_value}</p>
          ))}
          <h1>Animal Gender Preferences</h1>
          { personData.animal_gender_preferences.map((animal_gender: any) => (
            <p key={`animal-gender-${animal_gender.id}`}>{animal_gender.animal_value}</p>
          ))}
          <h1>Animal Size Preferences</h1>
          { personData.animal_size_preferences.map((animal_size: any) => (
            <p key={`animal-size-${animal_size.id}`}>{animal_size.animal_value}</p>
          ))}
          <h1>Animal Age Preferences</h1>
          { personData.animal_age_preferences.map((animal_age: any) => (
            <p key={`animal-age-${animal_age.id}`}>{animal_age.animal_value}</p>
          ))}
        </>
      )}
    </div>
  )
}

ReactDOM.render(<PersonProfile/>, pageTarget)
