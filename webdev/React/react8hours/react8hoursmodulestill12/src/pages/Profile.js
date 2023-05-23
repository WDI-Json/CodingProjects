import { ChangeProfile } from "../Components/ChangeProfile"
import { useContext } from "react"
import { AppContext } from "../App"

export const Profile = () => {
    const { userName, setUserName } = useContext(AppContext)
    return (
        <div>
            PROFILE, user is: {userName}
            <ChangeProfile />
        </div>
    )
}