import { createContext, useReducer } from "react"
import githubReducer from "./GithubReducer"

const GithubContext = createContext()

const GITHUB_URL = process.env.REACT_APP_GITHUB_URL
const GITHUB_TOKEN = "add later"

export const GithubProvider = ({ children }) => {
  const initialState = {
    users: [],
    loading: false,
  }

  const [state, dispatch] = useReducer(githubReducer, initialState)

  const fetchUsers = async () => {
    setLoading()
    const response = await fetch(
      `${GITHUB_URL}/users`
      //* you did not use a token
      //     , {
      //         headers: {
      //         Authorization: `token ${GITHUB_TOKEN}`
      //     }
      //   }
    )

    const data = await response.json()
    dispatch({
      type: "GET_USERS",
      payload: data,
    })
  }

  const setLoading = () => {
    dispatch({ type: "SET_LOADING" })
  }
  return (
    <GithubContext.Provider
      value={{
        users: state.users,
        loading: state.loading,
        fetchUsers,
      }}
    >
      {children}
    </GithubContext.Provider>
  )
}

export default GithubContext
