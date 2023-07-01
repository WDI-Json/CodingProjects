import React, { useState } from "react"
import PropTypes from "prop-types"

function RatingSelect({ select, start, end }) {
  const [selected, setSelected] = useState(1)

  const handleChange = (e) => {
    setSelected(+e.currentTarget.value)
    select(+e.currentTarget.value)
  }

  const renderRadioButtons = () => {
    const radioButtons = []
    for (let i = start; i <= end; i++) {
      radioButtons.push(
        <li key={i}>
          <input
            type="radio"
            name="rating"
            id={`num${i}`}
            value={i}
            onChange={handleChange}
            checked={selected === i}
          />
          <label htmlFor={`num${i}`}>{i}</label>
        </li>
      )
    }
    return radioButtons
  }

  return <ul className="rating">{renderRadioButtons()}</ul>
}

RatingSelect.defaultProps = {
  start: 1,
  end: 10,
}

RatingSelect.propTypes = {
  start: PropTypes.number.isRequired,
  end: PropTypes.number.isRequired,
}

export default RatingSelect
