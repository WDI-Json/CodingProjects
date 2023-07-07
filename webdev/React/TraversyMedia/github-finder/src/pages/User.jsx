import { useContext, useEffect } from "react"
import GithubContext from "../context/github/GithubContext"
import { useParams } from "react-router-dom"

function User() {
  const { getUser, user } = useContext(GithubContext)
  const params = useParams()

  useEffect(() => {
    getUser(params.login)
    // getUserRepos(params.login)
  }, [])

  return (
    <div>
      <h1>{user.login}</h1>
    </div>
  )
}

export default User
