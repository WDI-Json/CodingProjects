import { useState } from "react"
import { useContext } from "react"
import { AppContext } from "../App"

export const ChangeProfile = () => {
    const [newUserName, setNewUserName] = useState("")
    const { setUserName } = useContext(AppContext)
    return (
        <div>
            <input onChange={(event) => {
                setNewUserName(event.target.value)
            }} />
            <button onClick={() => setUserName(newUserName)}> Change userName </button>
        </div>
    )
}