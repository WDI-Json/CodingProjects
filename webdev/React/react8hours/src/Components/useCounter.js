import { useState } from "react"

export const useCounter = (value = 0) => {
    const [counter, setCounter] = useState(value)

    const decrement = () => {
        setCounter(counter - 1)
    }

    const incremenent = () => {
        setCounter(counter + 1)
    }

    const reset = () => {
        setCounter(0)
    }
    return { counter, decrement, incremenent, reset }
}