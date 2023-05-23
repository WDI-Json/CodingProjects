import { useState } from "react"

export interface Props {
    name: string
    email: string
    age: number
    isMarried: boolean
    friends: Props[]
    country: Country
}

export enum Country {
    Brazil = "Brazil",
    Canada = "Canada",
    France = "France"
}

export const Person = (props: Props) => {
    const [name, setName] = useState<string>("");

    return (
        <div>
            <h1>Name: {props.name}</h1>
            <h1>Email: {props.email}</h1>
            <h1>Age: {props.age}</h1>
            <h1>This person {props.isMarried ? "is" : "Is not"} MARRIED</h1>
            <h1>Country: {props.country}</h1>
            <h1>YOUR FRIENDS</h1>
            {props.friends.map((friend: Props) => {
                return(
                    <div>
                        <p>Name: {friend.name}</p>
                        <p>Email: {friend.email}</p>
                        <p>Age: {friend.age}</p>
                        <p>This person {friend.isMarried ? "is" : "Is not"} MARRIED</p>
                        <p>Country: {friend.country}</p>
                    </div>
                 )
            })}
            
        </div>
    )
}

