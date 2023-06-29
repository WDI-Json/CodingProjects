import React, { useState } from "react"

function FeedbackItem() {
  const [rating, setRating] = useState(10)
  const [text, setText] = useState(
    `Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo, molestias
    doloremque? Necessitatibus architecto, iste, expedita laborum
    voluptatibus ipsum inventore repellendus ratione adipisci esse mollitia
    voluptatem, fugit placeat pariatur animi atque? 
    `
  )

  return (
    <div className="card">
      <div className="num-display">{rating}</div>
      <div className="text-display">{text}</div>
    </div>
  )
}

export default FeedbackItem
