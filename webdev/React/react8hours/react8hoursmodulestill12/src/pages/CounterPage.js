import { Counter } from "../Components/Counter"
import { Person } from "../Components/Person"

export const CounterPage = () => {
    return (
        <div>
            <h1>Welcome to the CounterPage</h1>
            <Counter />
            <Person
                name="Wouter"
                email="Wouter@mail.com"
                age={29}
                isMarried={true}
                friends={["Bob", "Bert", "Timmy"]}
            />
        </div>
    )
}