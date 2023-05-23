import { useCounter } from "./useCounter"

export const Counter = () => {
    const { counter, incremenent, decrement, reset } = useCounter(0)

    return (
        <div>
            <p>{counter}</p>
            <button onClick={incremenent}>incremenent</button>
            <button onClick={decrement}>decrement</button>
            <button onClick={reset}>reset</button>
        </div>
    )
}