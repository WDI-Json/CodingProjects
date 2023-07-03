import { createContext, useState } from "react"
import { v4 as uuidv4 } from "uuid"

const FeedbackContext = createContext()

export const FeedbackProvider = ({ children }) => {
  const [feedback, setFeedback] = useState([
    {
      id: 1,
      text: "CONTEXT 1: Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iusto fuga, ab beatae perspiciatis harum adipisci voluptatibus dolore molestiae soluta eos excepturi deleniti eum sit asperiores, omnis, fugit ullam optio debitis!",
      rating: 8,
    },
    {
      id: 2,
      text: "CONTEXT 2: Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iusto fuga, ab beatae perspiciatis harum adipisci voluptatibus dolore molestiae soluta eos excepturi deleniti eum sit asperiores, omnis, fugit ullam optio debitis!",
      rating: 9,
    },
    {
      id: 3,
      text: "CONTEXT 3: Lorem ipsum dolor, sit amet consectetur adipisicing elit. Iusto fuga, ab beatae perspiciatis harum adipisci voluptatibus dolore molestiae soluta eos excepturi deleniti eum sit asperiores, omnis, fugit ullam optio debitis!",
      rating: 10,
    },
  ])

  const [feedbackEdit, setFeedbackEdit] = useState({
    item: {},
    edit: false,
  })

  const deleteFeedback = (id) => {
    if (window.confirm("Are you sure you want to delete?")) {
      setFeedback(feedback.filter((item) => item.id !== id))
    }
  }

  const editFeedback = (item) => {
    setFeedbackEdit({
      item,
      edit: true,
    })
  }
  const updateFeedback = (id, updatedItem) => {
    setFeedback(
      feedback.map((item) =>
        item.id === id ? { ...item, ...updatedItem } : item
      )
    )
  }

  const addFeedback = (newFeedback) => {
    newFeedback.id = uuidv4()
    setFeedback([newFeedback, ...feedback])
  }

  return (
    <FeedbackContext.Provider
      value={{
        feedback,
        deleteFeedback,
        addFeedback,
        editFeedback,
        feedbackEdit,
        updateFeedback,
      }}
    >
      {children}
    </FeedbackContext.Provider>
  )
}

export default FeedbackContext
